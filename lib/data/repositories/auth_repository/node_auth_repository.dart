import 'dart:async';

import 'package:ascension_mobile_app/data/exceptions/auth_exception.dart';
import 'package:ascension_mobile_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/networking/client/http_client.dart';
import 'package:ascension_mobile_app/networking/endpoints.dart';
import 'package:ascension_mobile_app/services/secure_storage_service.dart';
import 'package:dio/dio.dart';

class NodeAuthRepository extends AuthRepository {
  final HTTPClient httpClient;

  NodeAuthRepository({required this.httpClient});
  final _controller = StreamController<AuthenticationStatus>();

  @override
  Future<bool> isSignedIn() async {
    final response = await SecureStorageService.getToken('token');

    if (response == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<void> resendVerificationEmail({required String email}) {
    // TODO: implement resendVerificationEmail
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    const String endpoint = '/login';

    final Response response = await httpClient.post(Endpoints.baseUrl + endpoint, data: {'email': email, 'password': password});

    logger.wtf('Response: $response');

    await SecureStorageService.storeToken(key: 'token', token: response.data['data']['token']);

    _controller.add(AuthenticationStatus.authenticated);
  }

  @override
  Future<void> signOut() async {
    await SecureStorageService.removeToken();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  @override
  Future<String?> signUpWithEmailAndPassword(String email, String password) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Stream<AuthenticationStatus> get status async* {
    logger.wtf('checking auth status');
    final signedIn = isSignedIn();
    if (await signedIn) {
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
    yield* _controller.stream;
  }

  @override
  Future<bool> userAlreadyExists({required String email}) async {
    const String endpoint = '/userAlreadyExists';

    final Response response = await httpClient.post(Endpoints.baseUrl + endpoint, data: {'email': email});

    return response.data['data'];
  }

  @override
  void dispose() => _controller.close();
}
