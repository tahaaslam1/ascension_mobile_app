enum AuthenticationStatus { unknown, authenticated, unauthenticated }

abstract class AuthRepository {
  Stream<AuthenticationStatus> get status;
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<String?> signUpWithEmailAndPassword(String email, String password);
  Future<bool> userAlreadyExists({required String email});
  Future<void> resendVerificationEmail({required String email});
  bool isSignedIn();
  void dispose();
}
