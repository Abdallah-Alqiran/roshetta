part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {}
