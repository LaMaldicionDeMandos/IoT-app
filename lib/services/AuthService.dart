import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final String baseUrl = dotenv.env['SERVER_URL']!;
  final String loginPath = '/auth/login';
  final String googleLoginPath = '/auth/login/google';
  final String registerPath = '/auth/register';

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

  Future<dynamic> googleLogin() async {
    try {
      GoogleSignInAccount? account = await GoogleSignIn(
          clientId: "675364019815-7vod2r2kd696ca0v7mpun7cbbo8jc2ed.apps.googleusercontent.com",
        scopes: <String> ["email"]
      ).signIn();
      print(account?.email);
    } catch (error) {
      print(error);
    }
    /*
    if (await canLaunchUrl(Uri.parse(baseUrl + googleLoginPath))) {
      await launchUrl(Uri.parse(baseUrl + googleLoginPath));
    } else {
      throw 'Could not launch ${baseUrl + googleLoginPath}';
    }

 */
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

  Future<void> _handleRedirect(Uri uri) async {
    if (true /*uri.toString().startsWith(redirectUrl)*/) {
      // Aquí puedes extraer los parámetros necesarios, por ejemplo, un token
      final token = uri.queryParameters['token'];
      if (token != null) {
        print("success");
      } else {
        print("Claro pero yo necesito el toke, supongo que tengo que llamarlo");
      }
    }
  }
}