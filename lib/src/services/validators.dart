import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Informe seu email';
  }

  if (!email.isEmail) return 'Informe um email válido';

  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Informe sua senha';
  }

  if (password.length < 7) {
    return 'A senha tem que ter no mínimo 7 caracteres';
  }

  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Informe seu nome';
  }

  if (name.split(' ').length == 1) {
    return 'Informe seu nome completo';
  }

  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Informe seu celular';
  }

  if (!phone.isPhoneNumber || phone.length < 14) {
    return 'Informe um número válido';
  }

  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Informe seu cpf';
  }

  if (!cpf.isCpf) return 'Informe um cpf válido';

  return null;
}
