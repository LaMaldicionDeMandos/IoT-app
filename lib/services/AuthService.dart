import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
    if (response.statusCode == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('accessToken', response.body);
    } else {
      throw Exception('Failed login.');
    }
  }
}