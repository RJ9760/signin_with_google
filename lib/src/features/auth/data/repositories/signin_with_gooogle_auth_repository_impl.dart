import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/src/features/auth/domain/repositories/signin_with_google_auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient _supabase;

  AuthRepositoryImpl(this._supabase);

  @override
  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn.instance;

    final webClientId = dotenv.env['WEB_CLIENT_ID'];
    final iosClientId = dotenv.env['IOS_CLIENT_ID'];

    await googleSignIn.initialize(
      clientId: iosClientId,
      serverClientId: webClientId,
    );

    // This shows the native Google account list on the screen
    final googleAccount = await googleSignIn.authenticate();

    final authorization = await googleAccount.authorizationClient
        .authorizationForScopes(const ['email', 'profile', 'openid']);

    final googleAuthentication = googleAccount.authentication;
    final idToken = googleAuthentication.idToken;
    final accessToken = authorization?.accessToken;

    if (idToken == null || idToken.isEmpty) {
      throw const AuthException(
        'Google authentication failed: ID token is missing.',
      );
    }

    if (accessToken == null || accessToken.isEmpty) {
      throw const AuthException(
        'Google authentication failed: access token is missing.',
      );
    }

    final response = await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    if (response.session == null) {
      throw const AuthException(
        'Authentication succeeded, but no Supabase session was created.',
      );
    }

    final user = response.user!;

    // Optional: Save user profile
    await _supabase.from('profiles').upsert({
      'id': user.id,
      'email': user.email,
      'name': user.userMetadata?['full_name'],
    });
  }

  @override
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}