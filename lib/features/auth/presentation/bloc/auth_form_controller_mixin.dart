import 'package:flutter/material.dart';
import 'package:roshetta/features/auth/data/model/login_request_model.dart';
import 'package:roshetta/features/auth/data/model/register_request_model.dart';

mixin AuthFormControllersMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  
  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  bool validateRegisterForm() {
    return registerFormKey.currentState?.validate() ?? false;
  }

  RegisterRequestModel getRegisterRequest(String gender) {
    return RegisterRequestModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      name: nameController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      gender: gender,
      dateOfBirth: dateOfBirthController.text.trim(),
    );
  }

  void clearRegisterControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    dateOfBirthController.clear();
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

    void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
    confirmPasswordController.dispose();
  }
}
