part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {}

class GenderSelectedEvent extends AuthEvent {
  final String gender;
  GenderSelectedEvent(this.gender);
}

class RoleSelectedEvent extends AuthEvent {
  final String role;
  RoleSelectedEvent(this.role);
}