import 'package:dartz/dartz.dart';
import 'package:roshetta/features/clinic/booked_feature/data/model/booked_clinic_model.dart';

abstract class BookedClinicRepository {
  Future<Either<String, List<BookedClinicModel>>> getBookedClinic();
}
