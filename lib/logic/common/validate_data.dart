class ValidateData {
  //Validasi email
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email Harus Di isi";
    }
    // Validasi format email menggunakan regular expression
    String emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regExp = RegExp(emailRegex);
    if (!regExp.hasMatch(email)) {
      return 'Format Email Tidak Valid';
    }
    return null;
  }

  //Validasi password
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password harus diisi';
    }

    // Validasi panjang password
    if (password.length < 6) {
      return 'Password minimal harus terdiri dari 6 karakter';
    }

    if (!password.contains(RegExp(r'\d'))) {
      return 'Passord harus menggunakan angka';
    }

    return null; // Return null jika password valid
  }
}
