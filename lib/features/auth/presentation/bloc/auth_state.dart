part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess<T> extends AuthState {
  final T? data;
  AuthSuccess({this.data});
}

class AuthError extends AuthState {
  final String message;
  final Map<String, List<String>>? fieldErrors;
  AuthError({required this.message, this.fieldErrors});
}
