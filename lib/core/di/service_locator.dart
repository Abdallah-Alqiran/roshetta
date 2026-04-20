import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:roshetta/core/services/local/cache_helper.dart';
import 'package:roshetta/core/services/remote/api_consumer.dart';
import 'package:roshetta/core/services/remote/dio_consumer.dart';
import 'package:roshetta/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:roshetta/features/auth/domain/repositories/auth_repository.dart';
import 'package:roshetta/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:roshetta/features/clinic/availability_feature/data/repository/availability_clinic_repository_impl.dart';
import 'package:roshetta/features/clinic/availability_feature/domain/repository/availability_clinic_repository.dart';
import 'package:roshetta/features/clinic/availability_feature/presentation/bloc/availability_clinic_bloc.dart';
import 'package:roshetta/features/clinic/booked_feature/data/repository/booked_clinic_repository_impl.dart';
import 'package:roshetta/features/clinic/booked_feature/domain/repository/booked_clinic_repository.dart';
import 'package:roshetta/features/clinic/booked_feature/presentation/bloc/booked_clinic_bloc.dart';
import 'package:roshetta/features/clinic/profile_feature/data/repository/profile_repository_impl.dart';
import 'package:roshetta/features/clinic/profile_feature/domain/repository/profile_repository.dart';
import 'package:roshetta/features/clinic/profile_feature/presentation/bloc/profile_clinic_bloc.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/data/repositories/doctor_details_patient_repo_impl.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/domain/repositories/doctor_detials_patient_repo.dart';
import 'package:roshetta/features/patients/doctor_details_patient_feature/presentation/bloc/doctor_details_patient_bloc.dart';

import 'package:roshetta/root/bloc/root_bloc.dart';
final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Services
  final cacheHelper = CacheHelper();
  await cacheHelper.init();
  sl.registerLazySingleton<CacheHelper>(() => cacheHelper);

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiConsumer: sl(), cacheHelper: sl()),
  );

  sl.registerLazySingleton(() => AuthBloc(authRepository: sl(), cacheHelper: sl()));

  sl.registerLazySingleton<AvailabilityClinicRepository>(
    () => AvailabilityClinicRepositoryImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton(() => AvailabilityClinicBloc(availabilityClinicRepository: sl()));

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton(() => ProfileClinicBloc(profileRepository: sl()));


  sl.registerLazySingleton<BookedClinicRepository>(
    () => BookedClinicRepositoryImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton(() => BookedClinicBloc(bookedClinicRepository: sl()));

  sl.registerLazySingleton<DoctorDetailsPatientRepo>(
    () => DoctorDetailsPatientRepoImpl(apiConsumer: sl()),
  );
  sl.registerFactory(() => DoctorDetailsPatientBloc(
        doctorDetailsPatientRepo: sl(),
      ));

  sl.registerLazySingleton(() => RootBloc());

  
 
}
