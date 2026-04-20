class EndPoint {
  static String localUrl = "";
  static String remoteUrl = "http://roshetta.runasp.net/";

  static String baseUrl = remoteUrl;

  // auth
  static String login = "auth/login/";
  static String doctorRegistration = "auth/doctor-registration/";
  static String patientRegistration = "auth/patient-registration/";

  // clinic
  static String clinicAvailabilitySchedule = "doctorSchedule";
  static String clinicBooked = "Visit";

  //patinet
  // static String bookDoctor = "Visit";
}

class ApiKey {
  static String message = "message";
  static String authorization = "Authorization";
  static String accessToken = "access";
  static String role = "role";
  static String id = "id";
  static String email = "email";
  static String name = "name";
  static String gender = "gender";
  static String isLoggedIn = "isLoggedIn";
}
