
import 'package:app_shoe_store/composents/my_button.dart';
import 'package:app_shoe_store/composents/my_text_button.dart';
import 'package:app_shoe_store/composents/my_text_form_field.dart';
import 'package:app_shoe_store/provider/suffix_icon_field.dart';
import 'package:app_shoe_store/validate/validate_user.dart';
import 'package:app_shoe_store/views/loading/loading_dialog.dart';
import 'package:app_shoe_store/views/login/sign_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_shoe_store/configs/string.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        // Đăng nhập thành công, sau khi hoàn thành, bạn có thể ẩn dialog loading
       
      } on FirebaseAuthException catch (e) {
        if (e.code == 'network-request-failed') {
          // Xử lý lỗi mạng
          // Ở đây bạn có thể hiển thị thông báo lỗi cho người dùng hoặc thực hiện các xử lý cần thiết
        } else {
          // Xử lý các lỗi khác
        }
      }
       
    }
  }

  @override
  Widget build(BuildContext context) {
    final suffixIconProvider = Provider.of<SuffixIconProvider>(context);
    final validate = Provider.of<MyValidate>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Image.asset(
                    "./assets/images/logo.png",
                    width: 230,
                    height: 230,
                  ),
                ),
                const SizedBox(height: 16),
                MyTextFormField(
                  controller: emailController,
                  hintText: Tiltes.email,
                  icons: const Icon(Icons.email_outlined),
                  iconButton: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.transparent,
                    ),
                  ),
                  obscureText: false,
                  onValidate: (value) {
                    return validate.validateEmailLogin(value);
                  },
                ),
                const SizedBox(height: 8),
                MyTextFormField(
                  controller: passwordController,
                  hintText: Tiltes.password,
                  icons: const Icon(Icons.lock_outline),
                  iconButton: IconButton(
                    onPressed: () {
                      suffixIconProvider.togglePasswordVisibilityLogin();
                    },
                    icon: Icon(
                      suffixIconProvider.isPasswordVisibleLogin
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  obscureText: suffixIconProvider.isPasswordVisibleLogin,
                  onValidate: (value) {
                    return validate.validatePassword(value);
                  },
                ),
                const SizedBox(height: 32),
                MyButton(
                  onTap: () async {
                    showDialog(
                        context: context,
                        builder: (context) => const LoadingDialog());
                    await Future.delayed(const Duration(seconds: 2));
                    _login();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  },
                  title: Tiltes.login,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(Tiltes.new_sign),
                    MyTextButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignPage(),
                          ),
                        );
                      },
                      title: Tiltes.sign,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
