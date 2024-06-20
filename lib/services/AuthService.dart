import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final String baseUrl = dotenv.env['SERVER_URL']!;
  final String googleClientId = dotenv.env['GOOGLE_CLIENT_ID']!;
  final String loginPath = '/auth/login';
  final String googleRedirectPath = '/auth/oauth2/redirect/google';
  final String registerPath = '/auth/register';

  Future<dynamic> login(username, password) async {
    final response = await http.post(Uri.parse(baseUrl + loginPath),
        headers: <String, String> {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
      'username': username,
      'password': password
    }));
    saveAccessToken(response);
  }

  Future<dynamic> googleLogin() async {
    try {
      GoogleSignInAccount? account = await GoogleSignIn(
          clientId: googleClientId,
        scopes: <String> ["email"]
      ).signIn();
      saveAccessToken(await _redirect(account?.serverAuthCode));
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> register(name, username, password) async {
    final response = await http.post(Uri.parse(baseUrl + registerPath),
        headers: <String, String> {'Content-Type': 'application/json'},
        body: jsonEncode(<String, Object>{
          'profile': <String, String>{
            'first_name': name
          },
          'username': username,
          'password': password
        }));
    if (response.statusCode != 201) {
      throw Exception('Failed login.');
    }
  }

  Future<dynamic> _redirect(authCode) async {
    String uri = '$baseUrl$googleRedirectPath?code=$authCode&scope=email%20profile%20openid%20https://www.googleapis.com/auth/userinfo.profile%20https://www.googleapis.com/auth/userinfo.email&authuser=0&prompt=consent';
    return http.get(Uri.parse(uri));
  }

  void saveAccessToken(http.Response response) async {
    if (response.statusCode == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('accessToken', response.body);
    } else {
      throw Exception('Failed login.');
    }
  }
}