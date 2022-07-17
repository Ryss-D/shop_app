import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
//  String _token;
  //DateTime _expiryTime;
  //String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        // Api key is on configuration section on firebase
        //TODO: create env files to move keys
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDEZ4z3xuRq9LOhR7AOAOZYiFJMYTyiNb0');
    final response = await http.post(
      url,
      body: json.encode(
        {
          'emai': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
