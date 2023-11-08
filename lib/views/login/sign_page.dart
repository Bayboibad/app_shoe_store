import 'package:app_shoe_store/composents/my_button.dart';
import 'package:app_shoe_store/composents/my_text_button.dart';
import 'package:app_shoe_store/composents/my_text_form_field.dart';
import 'package:app_shoe_store/provider/suffix_icon_field.dart';
import 'package:app_shoe_store/services/firebase_auth.dart';
import 'package:app_shoe_store/validate/validate_user.dart';
import 'package:app_shoe_store/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_shoe_store/configs/string.dart';

class SignPage extends StatelessWidget {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final validate = MyValidate();
  final _formKey = GlobalKey<FormState>();
  void _signUp() {
    if (_formKey.currentState!.validate()) {
      // ignore: no_leading_underscores_for_local_identifiers
      final FirebaseAuthUser _auth = FirebaseAuthUser();
      _auth.addUserToFirebase(usernameController.text, emailController.text,
          passwordController.text, phoneController.text);
    }
  }

  SignPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Đăng Ký")),
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(16),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: Image.asset(
                  "./assets/images/logo.png",
                  width: 170,
                  height: 170,
                ),
              ),
              MyTextFormField(
                controller: usernameController,
                hintText: Tiltes.username,
                icons: const Icon(Icons.account_box),
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.transparent,
                  ),
                ),
                obscureText: false,
                // ignore: body_might_complete_normally_nullable
                onValidate: (p0) {
                  return validate.validateName(p0);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              MyTextFormField(
                controller: emailController,
                hintText: Tiltes.new_email,
                icons: const Icon(Icons.email_outlined),
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.transparent,
                  ),
                ),
                obscureText: false,
                // ignore: body_might_complete_normally_nullable
                onValidate: (p0) {
                  return validate.validateEmail(p0);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              MyTextFormField(
                controller: phoneController,
                hintText: Tiltes.phone,
                icons: const Icon(Icons.phone_android_outlined),
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.transparent,
                  ),
                ),
                obscureText: false,
                // ignore: body_might_complete_normally_nullable
                onValidate: (p0) {
                  return validate.validatePhone(p0);
                },
              ),
              const SizedBox(
                height: 8,
              ),
        
              Consumer<SuffixIconProvider>(builder: (context, value, child) {
                return MyTextFormField(
                  controller: passwordController,
                  hintText: Tiltes.password,
                  icons: const Icon(Icons.lock_outline),
                  iconButton: IconButton(
                    onPressed: () {
                      value.togglePasswordVisibility();
                    },
                    icon: Icon(
                      value.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  obscureText: value.isPasswordVisible,
                  onValidate: (p0) {
                    return validate.validatePassword(p0);
                  },
                );
              }),
              const SizedBox(
                height: 8,
              ),
              Consumer<SuffixIconProvider>(
                builder: (context, value, child) {
                  return MyTextFormField(
                    controller: rePasswordController,
                    hintText: Tiltes.password,
                    icons: const Icon(Icons.lock_outline),
                    iconButton: IconButton(
                      onPressed: () {
                        value.togglePasswordVisibilityed();
                      },
                      icon: Icon(
                        value.isRePasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    obscureText: value.isRePasswordVisible,
                    onValidate: (p0) {
                      return validate.validateConfirmPassword(
                          passwordController.text, p0!);
                    },
                  );
                },
              ),
              const SizedBox(
                height: 32,
              ),
              MyButton(
                  onTap: () {
                    _signUp();
                  },
                  title: Tiltes.sign),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(Tiltes.old_login),
                  MyTextButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      title: Tiltes.login),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
