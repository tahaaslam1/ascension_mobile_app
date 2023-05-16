import 'package:ascension_mobile_app/services/http/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpService {
  final Dio dio;

  const HttpService._(this.dio);

  factory HttpService() {
    final dio = Dio();
    dio.options.baseUrl = Endpoints.baseUrl;
    // dio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: true,
    //   error: true,
    //   compact: true,
    //   maxWidth: 90,
    // ));
    return HttpService._(dio);
  }

  Future<Response<T>> request<T>(
    RequestMethod method,
    String url, {
    data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.request(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        method: method.value,
        headers: headers,
      ),
    );
  }
}

enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch;

  String get value => toString().split('.').last.toUpperCase();
}
