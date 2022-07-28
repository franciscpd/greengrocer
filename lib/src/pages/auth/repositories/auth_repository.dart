import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/results/auth_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';
import 'package:greengrocer/src/pages/auth/repositories/auth_errors.dart'
    as auth_errors;

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.request(
      url: Endpoints.validateToken,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    if (result['result'] != null) {
      final UserModel user = UserModel.fromJson(result['result']);

      return AuthResult.sucess(user);
    } else {
      return AuthResult.error(auth_errors.authErrorsString(result['error']));
    }
  }

  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.request(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (result['result'] != null) {
      final UserModel user = UserModel.fromJson(result['result']);

      return AuthResult.sucess(user);
    } else {
      return AuthResult.error(auth_errors.authErrorsString(result['error']));
    }
  }
}
