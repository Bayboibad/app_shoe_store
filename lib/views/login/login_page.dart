import 'package:app_shoe_store/bloc/loading_bloc.dart';
import 'package:app_shoe_store/composents/my_button.dart';
import 'package:app_shoe_store/composents/my_text_button.dart';
import 'package:app_shoe_store/composents/my_text_form_field.dart';
import 'package:app_shoe_store/provider/suffix_icon_field.dart';
import 'package:app_shoe_store/services/firebase_store_user.dart';
import 'package:app_shoe_store/validate/validate_user.dart';
import 'package:app_shoe_store/views/home/home_screen.dart';
import 'package:app_shoe_store/views/loading/loading_dialog.dart';
import 'package:app_shoe_store/views/login/sign_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_shoe_store/configs/string.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var vaildate = MyValidate();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final suffixIconProvider = Provider.of<SuffixIconProvider>(context);
    final loadingBloc = context.read<LoadingBloc>();
    final FirebaseStoreUser firebaseStore = FirebaseStoreUser();
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 32,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Image.asset(
                  "./assets/images/logo.png",
                  width: 230,
                  height: 230,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
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
                validate: (p0) {
                  vaildate.validateEmail(p0);
                },
              ),
              const SizedBox(
                height: 8,
              ),
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
                validate: (p0) {
                  vaildate.validatePassword(p0);
                },
              ),

              const SizedBox(
                height: 32,
              ),
              MyButton(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) => const LoadingDialog());
                  loadingBloc.showLoading();
                  if (_formKey.currentState!.validate()) {
                    // Thực hiện công việc đăng nhập ở đây, ví dụ sử dụng hàm async

                    try {
                      // Simulate a login process with a delay
                      await Future.delayed(const Duration(seconds: 3));

                      // After the login process is complete, hide the loading dialog
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();

                      // Check the result of the login operation
                      DocumentSnapshot? userDoc =
                          await firebaseStore.getUserFirebase(
                              emailController.text, passwordController.text);

                      if (userDoc != null) {
                        Map<String, dynamic> userData =
                            userDoc.data() as Map<String, dynamic>;

                        if (userData['email'] == emailController.text &&
                            userData['password'] == passwordController.text) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        }
                      }
                    } catch (e) {
                      // Handle any exceptions that may occur during the login process
                      // ignore: avoid_print
                      print("Error during login: $e");
                      // Hide the loading dialog in case of an error
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    }
                  }
                },
                title: Tiltes.login,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(Tiltes.new_sign),
                  MyTextButton(
                      onTap: () {
                        loadingBloc.showLoading();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignPage()));
                      },
                      title: Tiltes.sign),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
