import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  bool _isAuthenticated = false;
  String? _userEmail;
  String? _userName;
  final String _baseUrl = 'http://127.0.0.1:8000';
  final _secure = const FlutterSecureStorage();

  bool get isAuthenticated => _isAuthenticated;
  String? get userEmail => _userEmail;
  String? get userName => _userName;

  Future<AuthResult> signIn(String email, String password) async {
    try {
      final res = await http.post(
        Uri.parse('$_baseUrl/auth/login'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: 'username=$email&password=$password',
      );
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        await _saveTokens(data['access_token'], data['refresh_token']);
        await _fetchMe();
        _isAuthenticated = true;
        return AuthResult.success();
      }
      return AuthResult.error('Invalid credentials');
    } catch (e) {
      return AuthResult.error('Sign in failed: ${e.toString()}');
    }
  }

  Future<AuthResult> signUp(
    String username,
    String email,
    String password,
  ) async {
    try {
      final res = await http.post(
        Uri.parse('$_baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        await _saveTokens(data['access_token'], data['refresh_token']);
        await _fetchMe();
        _isAuthenticated = true;
        return AuthResult.success();
      }
      return AuthResult.error('Invalid registration data');
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
    await _secure.delete(key: 'access_token');
    await _secure.delete(key: 'refresh_token');
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

  Future<void> loadSession() async {
    final token = await _secure.read(key: 'access_token');
    if (token != null && token.isNotEmpty) {
      _isAuthenticated = true;
      await _fetchMe();
    }
  }

  Future<void> _fetchMe() async {
    final token = await _getValidAccessToken();
    if (token == null) return;
    final res = await http.get(
      Uri.parse('$_baseUrl/auth/me'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      _userEmail = data['email'];
      _userName = data['username'];
    }
  }

  Future<void> _saveTokens(String access, String refresh) async {
    await _secure.write(key: 'access_token', value: access);
    await _secure.write(key: 'refresh_token', value: refresh);
  }

  Future<String?> _getAccessToken() async {
    return _secure.read(key: 'access_token');
  }

  Future<String?> _getRefreshToken() async {
    return _secure.read(key: 'refresh_token');
  }

  Future<String?> _getValidAccessToken() async {
    final token = await _getAccessToken();
    if (token == null) return null;
    final res = await http.get(
      Uri.parse('$_baseUrl/auth/me'),
      headers: { 'Authorization': 'Bearer $token' },
    );
    if (res.statusCode == 200) return token;
    final refresh = await _getRefreshToken();
    if (refresh == null) return null;
    final r = await http.post(
      Uri.parse('$_baseUrl/auth/refresh'),
      headers: { 'Content-Type': 'application/json' },
      body: json.encode({ 'token': refresh }),
    );
    if (r.statusCode == 200) {
      final data = json.decode(r.body);
      await _saveTokens(data['access_token'], data['refresh_token']);
      return data['access_token'];
    }
    return null;
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

  const AuthWrapper({super.key, required this.child, required this.authScreen});

  @override
  Widget build(BuildContext context) {
    return AuthService().isAuthenticated ? child : authScreen;
  }
}
