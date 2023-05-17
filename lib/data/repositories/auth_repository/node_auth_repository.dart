import 'dart:async';
import 'package:ascension_mobile_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/services/http/failure.dart';
import 'package:ascension_mobile_app/services/http/http_services.dart';
import 'package:ascension_mobile_app/services/secure_storage_service.dart';
import 'package:dio/dio.dart';

class NodeAuthRepository extends AuthRepository {
  final HttpService httpClient;

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

    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.post, endpoint, data: {'email': email, 'password': password});

      logger.wtf('Sign In Successfull: $response');

      await SecureStorageService.storeToken(key: 'token', token: response.data['data']['token']);

      _controller.add(AuthenticationStatus.authenticated);
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        throw Failure(message: 'Invalid Credentials');
      } else {
        throw Failure(message: 'Something went wrong');
      }
    }
  }

  @override
  Future<void> signOut() async {
    await SecureStorageService.removeToken();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  @override
  Future<void> signUpWithEmailAndPassword({required Map<String, dynamic> userData}) async {
    const String endpoint = '/signup';

    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.post, endpoint, data: userData);

      logger.wtf('Sign Up Successfull: $response');
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  Stream<AuthenticationStatus> get status async* {
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

    try {
      final Response response = await httpClient.request<Map<String, dynamic>>(RequestMethod.post, endpoint, data: {'email': email});

      return response.data['data'];
    } catch (e) {
      logger.e(e);
      throw Failure();
    }
  }

  @override
  void dispose() => _controller.close();
}
