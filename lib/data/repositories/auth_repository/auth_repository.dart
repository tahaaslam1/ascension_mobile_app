enum AuthenticationStatus { unknown, authenticated, unauthenticated }

abstract class AuthRepository {
  Stream<AuthenticationStatus> get status;
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<String> signUpWithEmailAndPassword({required Map<String, dynamic> userData});
  Future<bool> userAlreadyExists({required String email});
  Future<void> resendVerificationEmail({required String email});
  Future<bool> isSignedIn();

  Future<void> sendEmailVerification({required String userId, required String otp});
  void dispose();
}
