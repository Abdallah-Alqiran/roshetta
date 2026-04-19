String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'email_is_required';
  }
  final email = value.trim();
  if (email.length < 5) {
    return 'email_min_length';
  }
  if (email.length > 50) {
    return 'email_max_length';
  }
  final emailRegex = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
  );
  if (!emailRegex.hasMatch(email)) {
    return 'invalid_email_format';
  }
  if (email.contains('..')) {
    return 'email_consecutive_dots';
  }
  if (email.startsWith('.') || email.endsWith('.')) {
    return 'email_dot_position';
  }
  final parts = email.split('@');
  if (parts.length != 2) {
    return 'email_one_at_symbol';
  }
  final domain = parts[1];
  if (!domain.contains('.')) {
    return 'email_domain_dot';
  }
  if (domain.startsWith('.') || domain.endsWith('.')) {
    return 'email_domain_dot_position';
  }
  return null;
}

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'name_is_required';
  }
  final name = value.trim();
  if (name.length < 2) {
    return 'name_min_length';
  }
  if (name.length > 30) {
    return 'name_max_length';
  }
  // Allow both English and Arabic characters
  final nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');
  if (!nameRegex.hasMatch(name)) {
    return 'name_letters_only';
  }
  if (name.startsWith(' ') || name.endsWith(' ')) {
    return 'name_space_position';
  }
  if (name.contains(RegExp(r'\s{2,}'))) {
    return 'name_consecutive_spaces';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'password_is_required';
  }
  if (value.length < 8) {
    return 'password_min_length';
  }
  if (value.length > 32) {
    return 'password_max_length';
  }
  final passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,32}$',
  );
  if (!passwordRegex.hasMatch(value)) {
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'password_uppercase_required';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'password_lowercase_required';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'password_number_required';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'password_special_char_required';
    }
    return 'password_invalid';
  }
  return null;
}
