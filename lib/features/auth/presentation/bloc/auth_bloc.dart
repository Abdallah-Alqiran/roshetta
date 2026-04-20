import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/core/services/local/cache_helper.dart';
import 'package:roshetta/core/utils/api_error_handler.dart';
import 'package:roshetta/features/auth/data/model/auth_response_model.dart';
import 'package:roshetta/features/auth/domain/repositories/auth_repository.dart';
import 'package:roshetta/features/auth/presentation/bloc/auth_form_controller_mixin.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with AuthFormControllersMixin {
  final AuthRepository authRepository;
  final CacheHelper? cacheHelper;

  String? selectedGender;
  String? selectedRole;

  AuthBloc({required this.authRepository, required this.cacheHelper})
      : super(AuthInitial()) {
   
    on<GenderSelectedEvent>((event, emit) {
      selectedGender = event.gender;
    });
    
    on<RoleSelectedEvent>((event, emit) {
      selectedRole = event.role;
    });
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);
  }
  
  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    if (!validateLoginForm()) {
      emit(AuthError(message: 'Please fill all fields correctly'));
      return;
    }

    emit(AuthLoading());

    final request = getLoginRequest();
    final result = await authRepository.login(request);

    result.fold(
      (error) {
        final errorResponse = ApiErrorHandler.handle(error);
        emit(AuthError(
          message: errorResponse.message,
          fieldErrors: errorResponse.fieldErrors,
        ));
      },
      (successResponse) {
        clearLoginControllers();
        emit(AuthSuccess<AuthResponseModel>(data: successResponse));
      },
    );
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    if (!validateRegisterForm() || selectedRole == null || selectedGender == null) {
      emit(AuthError(message: 'Please fill all fields correctly and select role and gender'));
      return;
    }

    emit(AuthLoading());

    final request = getRegisterRequest(selectedGender!);

    final result = await authRepository.register(request, selectedRole!);

    result.fold(
      (error) {
        final errorResponse = ApiErrorHandler.handle(error);
        emit(AuthError(
          message: errorResponse.message,
          fieldErrors: errorResponse.fieldErrors,
        ));
      },
      (successResponse) {
        clearRegisterControllers();
        emit(AuthSuccess<AuthResponseModel>(data: successResponse));
      },
    );
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    await authRepository.logout();
    emit(AuthInitial());
  }

  @override
  Future<void> close() {
    disposeControllers();
    return super.close();
  }
}