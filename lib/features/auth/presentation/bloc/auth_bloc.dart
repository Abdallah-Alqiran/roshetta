import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshetta/core/services/local/cache_helper.dart';
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
  }
  
  @override
  Future<void> close() {
    disposeControllers();
    return super.close();
  }
}