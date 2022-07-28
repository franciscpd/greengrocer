import 'package:get/get.dart';

import 'package:greengrocer/src/pages/auth/repositories/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/results/auth_result.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final UtilsServices _utilsServices = UtilsServices();

  RxBool isLoading = false.obs;

  Future<void> sigIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result = await _authRepository.signIn(
      email: email,
      password: password,
    );

    isLoading.value = false;

    result.when(
      sucess: (user) {
        print(user);
      },
      error: (message) {
        _utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
