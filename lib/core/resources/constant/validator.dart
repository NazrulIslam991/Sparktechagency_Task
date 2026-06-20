class ValidationManager {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Full name is required";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegex = RegExp(r"^[a-zA-Z][a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]*@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return "Invalid email format";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone Number is required";
    }
    final phoneRegex = RegExp(r'^\+?[0-9]{1,16}$');

    if (!phoneRegex.hasMatch(value)) {
      return "Invalid phone number format";
    }
    return null;
  }

  static String? validateLocation(String? value) {
    if (value == null || value.isEmpty) {
      return "Location is required";
    }
    return null;
  }

  static String? validateDOB(String? value) {
    if (value == null || value.isEmpty) {
      return "Data of birth is required";
    }
    return null;
  }

  static String? validateBio(String? value) {
    if (value == null || value.isEmpty) {
      return "Bio is required";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? password,
      String? confirmPassword,
      ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password is required";
    }
    if (password != confirmPassword) {
      return "Passwords do not match";
    }
    return null;
  }

  // mask email
  static String maskEmail(String email) {
    if (email.isEmpty || !email.contains('@')) return email;

    final parts = email.split('@');
    final name = parts[0];
    final domain = parts[1];

    if (name.length <= 2) {
      return "${name[0]}***@$domain";
    }

    final maskedName = name.replaceRange(
      2,
      name.length - 1,
      '*' * (name.length - 3),
    );
    return "$maskedName@$domain";
  }
}
