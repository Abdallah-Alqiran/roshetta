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

  // clinic profile
  static String profileDoctor = '/profile/doctor';
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

class Constants {
  static List<String> allDepartments = [
    "الطب الباطني",
    "طب الأطفال",
    "الجراحة العامة",
    "طب القلب والأوعية الدموية",
    "طب العظام",
    "طب النساء والتوليد",
    "الأمراض الجلدية",
    "طب الأنف والأذن والحنجرة",
    "طب العيون",
    "المخ والأعصاب",
    "طب الأسنان",
    "طب الأورام",
    "طب المسالك البولية",
    "طب النفسية والعصبية",
    "طب التخدير",
    "طب الطوارئ",
    "طب الأسرة",
    "الأشعة والتصوير الطبي",
    "الطب الطبيعي وإعادة التأهيل",
    "أمراض الدم",
  ];
}
