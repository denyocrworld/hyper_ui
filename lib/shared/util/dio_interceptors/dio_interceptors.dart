import 'package:dio/dio.dart';
import 'package:hyper_ui/core.dart';

Dio dio = Dio();

class Diointerceptors {
  static init() {
    dio.options = BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer 123123asfasfz1231',
      },
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          return handler.next(e);
        },
      ),
    );
  }
}
