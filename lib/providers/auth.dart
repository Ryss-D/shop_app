import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token = '';
  DateTime _expiryDate = DateTime(0);
  String _userId = '';
  Timer _authTimer;

  bool get isAuth {
    return token != '';
  }

  String get token {
    if (_expiryDate != DateTime(0) &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != '') {
      return _token;
    }
    return '';
  }

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        // Api key is on configuration section on firebase
        //TODO: create env files to move keys
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDEZ4z3xuRq9LOhR7AOAOZYiFJMYTyiNb0');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      // we add this because firebase didnt response with error status
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    _autoLogout();
    return _authenticate(email, password, 'signInWithPassword');
  }

  void logout() {
    _token = '';
    _userId = '';
    _expiryDate = DateTime(0);
    notifyListeners;
    if (_authTimer.isActive) {
      _authTimer.cancel();
    }
  }

  void _autoLogout() {
    if (_authTimer.isActive) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    //Timer allow us to run a specific command passed a certain amount of time
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
