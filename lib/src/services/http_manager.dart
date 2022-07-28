import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class HttpMethods {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

class HttpManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['PARSE_BASE_URL']!,
    ),
  );

  Future request({
    required String url,
    String method = HttpMethods.get,
    Map? headers,
    Map? body,
  }) async {
    final Map<String, dynamic> defaultHeaders =
        headers?.cast<String, dynamic>() ?? {}
          ..addAll({
            'content-type': 'application/json',
            'accept': 'application/json',
            'X-Parse-Application-Id': dotenv.env['PARSE_APPLICATION_ID'],
            'X-Parse-REST-API-Key': dotenv.env['PARSE_REST_API_KEY'],
          });

    try {
      Response<Map> response = await dio.request(
        url,
        options: Options(
          method: method,
          headers: defaultHeaders,
        ),
        data: body,
      );

      return response.data;
    } on DioError catch (error) {
      return error.response?.data ?? {};
    } catch (error) {
      return {};
    }
  }
}
