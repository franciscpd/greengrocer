import 'package:get/get.dart';

import 'package:greengrocer/src/constants/storage_keys.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repositories/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/results/auth_result.dart';
import 'package:greengrocer/src/routes/app_pages.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final UtilsServices _utilsServices = UtilsServices();

  UserModel user = UserModel();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  Future<void> validateToken() async {
    String? token = await _utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      return Get.offAllNamed(AppRoutes.signin);
    }

    AuthResult result = await _authRepository.validateToken(token);

    result.when(
      sucess: (user) {
        this.user = user;

        saveTokenAndProceedToHome();
      },
      error: (message) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    user = UserModel();

    await _utilsServices.removeLocalData(key: StorageKeys.token);

    Get.offAllNamed(AppRoutes.signin);
  }

  void saveTokenAndProceedToHome() {
    _utilsServices.saveLocalData(key: StorageKeys.token, value: user.token!);

    Get.offAllNamed(AppRoutes.home);
  }

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
        this.user = user;

        saveTokenAndProceedToHome();
      },
      error: (message) {
        _utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<void> signUp() async {
    isLoading.value = true;

    AuthResult result = await _authRepository.signUp(user);

    isLoading.value = false;

    result.when(
      sucess: (user) {
        this.user = user;

        saveTokenAndProceedToHome();
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
