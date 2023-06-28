// Encrypt password ke algorighma sha-256
import 'dart:convert';

import 'package:crypto/crypto.dart';

String encryptPassword(String password) {
  var bytes = utf8.encode(password); // Konversi password ke dalam bentuk bytes
  var hashedPassword = sha256
      .convert(bytes)
      .toString(); // Gunakan algoritma SHA-256 untuk hashing
  return hashedPassword;
}
