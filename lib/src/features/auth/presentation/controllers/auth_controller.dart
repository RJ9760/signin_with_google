import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/features/auth/data/providers/auth_providers.dart';

final authControllerProvider =
    AsyncNotifierProvider<AuthController, void>(AuthController.new);

class AuthController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // Initial state
  }

  /// Returns true if login is successful, false if failed
 Future<bool> signInWithGoogle() async {
  state = const AsyncValue.loading();

  try {
    await ref.read(authRepositoryProvider).signInWithGoogle();
    state = const AsyncValue.data(null);
    return true;
  } catch (e, st) {
    // User cancelled the Google account picker
    if (e.toString().toLowerCase().contains('cancel') ||
        e.toString().toLowerCase().contains('canceled')) {
      state = const AsyncValue.data(null); // Don't treat as error
      return false;
    }

    state = AsyncValue.error(e, st);
    return false;
  }
}
}



String getFriendlyErrorMessage(Object error) {
  final message = error.toString().toLowerCase();

  if (message.contains('network') || message.contains('socket')) {
    return 'No internet connection. Please check your network.';
  }

  if (message.contains('cancel') || message.contains('canceled')) {
    return 'Sign in was cancelled.';
  }

  if (message.contains('id token') || message.contains('access token')) {
    return 'Google authentication failed. Please try again.';
  }

  return 'Something went wrong. Please try again.';
}