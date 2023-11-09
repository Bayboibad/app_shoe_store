import 'package:flutter/material.dart';

class SuffixIconProvider with ChangeNotifier {
  bool _isPasswordVisibleLogin = true;

  bool get isPasswordVisibleLogin => _isPasswordVisibleLogin;

  void togglePasswordVisibilityLogin() {
    _isPasswordVisibleLogin = !_isPasswordVisibleLogin;
    notifyListeners();
  }

  // Sign_page
  bool _isPasswordVisible = true;
  bool get isPasswordVisible => _isPasswordVisible;
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  bool _isRePasswordVisible = true;
  bool get isRePasswordVisible => _isRePasswordVisible;
  void togglePasswordVisibilityed() {
    _isRePasswordVisible = !_isRePasswordVisible;
    notifyListeners();
  }

  bool _isPasswordVisibleAccount = true;
  bool get isPasswordVisibleAccount => _isPasswordVisibleAccount;
  void togglePasswordVisibilityAcount() {
    _isPasswordVisibleAccount = !_isPasswordVisibleAccount;
    notifyListeners();
  }
}
