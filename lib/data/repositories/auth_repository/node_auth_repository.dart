import 'dart:async';

import 'package:ascension_mobile_app/data/exceptions/auth_exception.dart';
import 'package:ascension_mobile_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:ascension_mobile_app/networking/client/http_client.dart';

class NodeAuthRepository extends AuthRepository {
  //final HTTPClient httpClient;

  //NodeAuthRepository({required this.httpClient});
  final _controller = StreamController<AuthenticationStatus>();

  @override
  bool isSignedIn() {
    //TODO : check token para wa he ya nahi
    return true;
  }

  @override
  Future<void> resendVerificationEmail({required String email}) {
    // TODO: implement resendVerificationEmail
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<String?> signUpWithEmailAndPassword(String email, String password) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Stream<AuthenticationStatus> get status async* {
    final signedIn = isSignedIn();
    if (signedIn) {
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
    yield* _controller.stream;
  }

  @override
  Future<bool> userAlreadyExists({required String email}) {
    // TODO: implement userAlreadyExists
    throw UnimplementedError();
  }

  @override
  void dispose() => _controller.close();
}
