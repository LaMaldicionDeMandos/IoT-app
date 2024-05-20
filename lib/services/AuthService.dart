import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = dotenv.env['SERVER_URL']!;
  final String loginPath = '/auth/login';

  Future<dynamic> login(username, password) async {
    final response = await http.post(Uri.parse(baseUrl + loginPath),
        headers: <String, String> {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
      'username': username,
      'password': password
    }));
    if (response.statusCode == 201) {
      print(response.body);
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed login.');
    }
  }
}