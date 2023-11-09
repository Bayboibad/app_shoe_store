import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyValidate extends ChangeNotifier {
  RegExp expName = RegExp(r"<[^>]*>");
  RegExp expEmail = RegExp(r"""
^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""");
  RegExp expPhone = RegExp(r"^\d+$");
  final _auth = FirebaseAuth.instance.currentUser;
  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Vui lòng nhập name';
    } else if (expName.hasMatch(name)) {
      return 'Vui lòng nhập name hợp lệ';
    }
    notifyListeners();
    return null;
  }

  String? validateEmailLogin(String? email) {
    if (email == null || email.isEmpty) {
      return 'Vui lòng nhập email';
    } else if (!expEmail.hasMatch(email)) {
      return 'Vui lòng nhập email hợp lệ';
    } else if (_auth != null) {
      if (email != _auth?.email) {
        return 'Nhập sai tên email';
      }
    }

    notifyListeners();
    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Vui lòng nhập email';
    } else if (!expEmail.hasMatch(email)) {
      return 'Vui lòng nhập email hợp lệ';
    }
    notifyListeners();
    return null;
  }

  String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Vui lòng nhập phone';
    } else if (!expPhone.hasMatch(phone)) {
      return 'Vui lòng nhập phone hợp lệ';
    }
    notifyListeners();
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    } else if (password.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    notifyListeners();
    return null;
  }

  String? validatePasswordLogin(String? password) {
    if (password == null || password.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    } else if (password.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    notifyListeners();
    return null;
  }

  String? validateConfirmPassword(String? password, String pass) {
    if (password == null || password.isEmpty) {
      return 'Vui lòng xác nhận mật khẩu';
    } else if (password.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    } else if (password != pass) {
      return 'Mật khẩu không trùng khớp';
    }
    notifyListeners();
    return null;
  }
}
