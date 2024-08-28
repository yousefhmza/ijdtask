import 'package:dio/dio.dart';
import '../../../config/navigation/navigation.dart';
import '../error/error_handler.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == ResponseCode.unauthorized) {
      // NavigationService.push(Routes.authScreen);
    } else {
      handler.next(err);
    }
  }
}
