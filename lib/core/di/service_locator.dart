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

import 'package:roshetta/features/patients/home_patients_feature/data/repositories/home_patients_repository_impl.dart';
import 'package:roshetta/features/patients/home_patients_feature/domain/repositories/home_patients_repository.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_bloc.dart';
import 'package:roshetta/features/patients/profile_patients_feature/data/repositories/profile_patient_repository_impl.dart';
import 'package:roshetta/features/patients/profile_patients_feature/domain/repositories/profile_patient_repository.dart';
import 'package:roshetta/features/patients/profile_patients_feature/presentation/bloc/profile_patient_bloc.dart';
import 'package:roshetta/features/patients/home_patients_feature/data/repository/home_repository_impl.dart';
import 'package:roshetta/features/patients/home_patients_feature/domain/repository/home_repository.dart';
import 'package:roshetta/features/patients/home_patients_feature/presentation/bloc/home_patients_bloc.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/data/repository/patient_details_repository_impl.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/domain/repository/patient_details_repository.dart';
import 'package:roshetta/features/patients/patients_details_doctor_feature/presentation/bloc/patient_details_bloc.dart';

import 'package:roshetta/root/bloc/root_bloc.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  final cacheHelper = CacheHelper();
  await cacheHelper.init();
  sl.registerLazySingleton<CacheHelper>(() => cacheHelper);

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiConsumer: sl(), cacheHelper: sl()),
  );

  sl.registerLazySingleton(
    () => AuthBloc(authRepository: sl(), cacheHelper: sl()),
  );

  sl.registerLazySingleton<AvailabilityClinicRepository>(
    () => AvailabilityClinicRepositoryImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton(
    () => AvailabilityClinicBloc(availabilityClinicRepository: sl()),
  );

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton(() => ProfileClinicBloc(profileRepository: sl()));

  sl.registerLazySingleton<BookedClinicRepository>(
    () => BookedClinicRepositoryImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton(
    () => BookedClinicBloc(bookedClinicRepository: sl()),
  );

  sl.registerLazySingleton<DoctorDetailsPatientRepo>(
    () => DoctorDetailsPatientRepoImpl(apiConsumer: sl()),
  );
  sl.registerFactory(
    () => DoctorDetailsPatientBloc(doctorDetailsPatientRepo: sl()),
  );

  sl.registerLazySingleton<ProfilePatientRepository>(
    () => ProfilePatientRepositoryImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton(
    () => ProfilePatientBloc(profilePatientRepository: sl()),
  );

  sl.registerLazySingleton<HomePatientsRepository>(
    () => HomePatientsRepositoryImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton(() => HomePatientsBloc(homeRepository: sl()));
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(apiConsumer: sl()),
  );

  sl.registerLazySingleton<PatientDetailsRepository>(
    () => PatientDetailsRepositoryImpl(apiConsumer: sl()),
  );
  sl.registerFactory(() => PatientDetailsBloc(repository: sl()));

  sl.registerLazySingleton(() => RootBloc());
}
