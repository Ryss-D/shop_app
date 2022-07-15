import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:https/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryTime;
  String _userId;

  Future<void> signup(String email, String password) async {
    // Api key is on configuration section on firebase
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDEZ4z3xuRq9LOhR7AOAOZYiFJMYTyiNb0');
    final response = http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
  }

  void logOut() {}
}
