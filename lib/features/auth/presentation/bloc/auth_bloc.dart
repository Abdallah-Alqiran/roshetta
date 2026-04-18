import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/core/services/local/cache_helper.dart';
import 'package:roshetta/features/auth/domain/repositories/auth_repository.dart';
import 'package:roshetta/features/auth/presentation/bloc/auth_form_controller_mixin.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with AuthFormControllersMixin {
  final AuthRepository authRepository;
  final CacheHelper? cacheHelper;

  AuthBloc({required this.authRepository, required this.cacheHelper})
      : super(AuthInitial());
}