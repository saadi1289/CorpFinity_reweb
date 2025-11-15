import 'package:flutter/material.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  bool _isAuthenticated = false;
  String? _userEmail;
  String? _userName;

  bool get isAuthenticated => _isAuthenticated;
  String? get userEmail => _userEmail;
  String? get userName => _userName;

  Future<AuthResult> signIn(String email, String password) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Simple validation for demo
      if (email.isNotEmpty && password.isNotEmpty) {
        _isAuthenticated = true;
        _userEmail = email;
        _userName = email.split('@')[0];
        return AuthResult.success();
      } else {
        return AuthResult.error('Invalid credentials');
      }
    } catch (e) {
      return AuthResult.error('Sign in failed: ${e.toString()}');
    }
  }

  Future<AuthResult> signUp(String username, String email, String password) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Simple validation for demo
      if (username.isNotEmpty && email.isNotEmpty && password.length >= 8) {
        _isAuthenticated = true;
        _userEmail = email;
        _userName = username;
        return AuthResult.success();
      } else {
        return AuthResult.error('Invalid registration data');
      }
    } catch (e) {
      return AuthResult.error('Sign up failed: ${e.toString()}');
    }
  }

  Future<AuthResult> signInWithGoogle() async {
    try {
      // Simulate Google Sign In
      await Future.delayed(const Duration(seconds: 1));
      
      _isAuthenticated = true;
      _userEmail = 'user@gmail.com';
      _userName = 'Google User';
      return AuthResult.success();
    } catch (e) {
      return AuthResult.error('Google sign in failed: ${e.toString()}');
    }
  }

  Future<AuthResult> signInWithFacebook() async {
    try {
      // Simulate Facebook Sign In
      await Future.delayed(const Duration(seconds: 1));
      
      _isAuthenticated = true;
      _userEmail = 'user@facebook.com';
      _userName = 'Facebook User';
      return AuthResult.success();
    } catch (e) {
      return AuthResult.error('Facebook sign in failed: ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    _isAuthenticated = false;
    _userEmail = null;
    _userName = null;
  }

  Future<AuthResult> resetPassword(String email) async {
    try {
      // Simulate password reset
      await Future.delayed(const Duration(seconds: 1));
      return AuthResult.success();
    } catch (e) {
      return AuthResult.error('Password reset failed: ${e.toString()}');
    }
  }
}

class AuthResult {
  final bool success;
  final String? error;

  AuthResult.success() : success = true, error = null;
  AuthResult.error(this.error) : success = false;
}

class AuthWrapper extends StatelessWidget {
  final Widget child;
  final Widget authScreen;

  const AuthWrapper({
    super.key,
    required this.child,
    required this.authScreen,
  });

  @override
  Widget build(BuildContext context) {
    return AuthService().isAuthenticated ? child : authScreen;
  }
}