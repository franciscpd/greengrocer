import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:greengrocer/src/pages/auth/components/custom_elevated_button.dart';
import 'package:greengrocer/src/pages/auth/controllers/auth_controller.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/services/validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final MaskTextInputFormatter cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    //Formulário
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //email
                          CustomTextField(
                            icon: Icons.email,
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: emailValidator,
                            onSaved: (String? newValue) {
                              _authController.user.email = newValue;
                            },
                          ),
                          //senha
                          CustomTextField(
                            icon: Icons.lock,
                            label: 'Senha',
                            isSecret: true,
                            validator: passwordValidator,
                            onSaved: (String? newValue) {
                              _authController.user.password = newValue;
                            },
                          ),
                          CustomTextField(
                            icon: Icons.person,
                            label: 'Nome',
                            validator: nameValidator,
                            onSaved: (String? newValue) {
                              _authController.user.fullName = newValue;
                            },
                          ),
                          CustomTextField(
                            icon: Icons.phone,
                            label: 'Celular',
                            inputFormatters: [phoneFormatter],
                            keyboardType: TextInputType.phone,
                            validator: phoneValidator,
                            onSaved: (String? newValue) {
                              _authController.user.phone = newValue;
                            },
                          ),
                          CustomTextField(
                            icon: Icons.file_copy,
                            label: 'CPF',
                            inputFormatters: [cpfFormatter],
                            keyboardType: TextInputType.number,
                            validator: cpfValidator,
                            onSaved: (String? newValue) {
                              _authController.user.cpf = newValue;
                            },
                          ),
                          //Cadastrar
                          Obx(
                            () {
                              return CustomElevatedButton(
                                text: 'Cadastrar Usuário',
                                isLoading: _authController.isLoading.value,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    _authController.signUp();
                                  }
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //Voltar
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
