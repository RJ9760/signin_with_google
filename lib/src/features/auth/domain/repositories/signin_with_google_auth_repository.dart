abstract class AuthRepository {
  Future<void> signInWithGoogle();
  Future<void> signOut();
}