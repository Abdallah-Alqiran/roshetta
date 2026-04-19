import 'package:flutter/material.dart';
import 'package:roshetta/features/auth/data/model/login_request_model.dart';

mixin AuthFormControllersMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  
  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  //Register
  bool validateRegisterForm() {
    return registerFormKey.currentState?.validate() ?? false;
  }

  // RegisterRequestModel getRegisterRequest() {
  //   return RegisterRequestModel(
  //     firstName: firstNameController.text.trim(),
  //     lastName: lastNameController.text.trim(),
  //     email: emailController.text.trim(),
  //     password: passwordController.text.trim(),
  //   );
  // }

  void clearRegisterControllers() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    confirmPasswordController.clear();
  }


  bool validateLoginForm() {
    return loginFormKey.currentState?.validate() ?? false;
  }


  LoginRequestModel getLoginRequest() {
    return LoginRequestModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  void clearLoginControllers() {
    emailController.clear();
    passwordController.clear();
  }

  

  // Dispose all
  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
  }
}
