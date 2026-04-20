import 'package:roshetta/features/clinic/profile_feature/data/model/profile_clinic_model.dart';

abstract class ProfileClinicEvent {}

class GetProfileClinicEvent extends ProfileClinicEvent {}

class UpdateProfileClinicEvent extends ProfileClinicEvent {
  final ProfileClinicModel profile;

  UpdateProfileClinicEvent({required this.profile});
}