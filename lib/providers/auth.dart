import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryTime;
  String _userId;

  Future<void> signup(String email, String password) async {
    // Api key is on configuration section on firebase
    final url = Uri.parse(
        //TODO: create env files to move keys
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

  Future<void> login(String email, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDEZ4z3xuRq9LOhR7AOAOZYiFJMYTyiNb0');
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
}
