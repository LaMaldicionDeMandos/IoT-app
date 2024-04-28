import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl;

  AuthService({required this.baseUrl});

  Future<dynamic> login(dynamic data) async {
    return Future.value("OK");
  }
}