import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/results/auth_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';
import 'package:greengrocer/src/pages/auth/repositories/auth_errors.dart'
    as auth_errors;

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleResponse(Map<dynamic, dynamic> response) {
    if (response['result'] != null) {
      final UserModel user = UserModel.fromJson(response['result']);

      return AuthResult.sucess(user);
    } else {
      return AuthResult.error(auth_errors.authErrorsString(response['error']));
    }
  }

  Future<AuthResult> validateToken(String token) async {
    final response = await _httpManager.request(
      url: Endpoints.validateToken,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    return handleResponse(response);
  }

  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _httpManager.request(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    return handleResponse(response);
  }

  Future<AuthResult> signUp(UserModel user) async {
    final response = await _httpManager.request(
      url: Endpoints.signup,
      method: HttpMethods.post,
      body: user.toJson(),
    );

    return handleResponse(response);
  }
}
