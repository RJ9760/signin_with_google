import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/src/features/auth/data/repositories/signin_with_gooogle_auth_repository_impl.dart';
import 'package:todo/src/features/auth/domain/repositories/signin_with_google_auth_repository.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return AuthRepositoryImpl(supabase);
});