import 'package:crypto/crypto.dart';
import 'dart:convert';

class PasswordOperation {
  String getPasswordHash(String pass,String salt) {
    var bytes = utf8.encode(pass+salt);
    Digest digest = sha256.convert(bytes);
    return digest.toString();
  }

}