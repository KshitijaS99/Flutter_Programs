import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String _userId = '';
  String _userName = '';
  String _userEmail = '';

  bool get isAuthenticated => _isAuthenticated;
  String get userId => _userId;
  String get name => _userName;
  String get email => _userEmail;

  Future<void> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    _isAuthenticated = true;
    _userId = 'user123';
    _userName = email.split('@')[0];
    _userEmail = email;
    
    notifyListeners();
  }

  Future<void> register(String name, String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    _isAuthenticated = true;
    _userId = 'user123';
    _userName = name;
    _userEmail = email;
    
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _userId = '';
    _userName = '';
    _userEmail = '';
    notifyListeners();
  }
} 