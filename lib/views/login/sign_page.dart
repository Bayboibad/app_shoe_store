import 'package:app_shoe_store/bloc/user_bloc.dart';
import 'package:app_shoe_store/composents/my_button.dart';
import 'package:app_shoe_store/composents/my_text_button.dart';
import 'package:app_shoe_store/composents/my_text_form_field.dart';
import 'package:app_shoe_store/provider/suffix_icon_field.dart';
import 'package:app_shoe_store/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:app_shoe_store/configs/string.dart';

class SignPage extends StatelessWidget {
  final userAdditionCubit = UserAdditionCubit();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final phoneController = TextEditingController();
  SignPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userAdditionCubit,
      child: Scaffold(
        appBar: AppBar(title: const Text("Đăng Ký")),
        // ignore: avoid_unnecessary_containers
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(16),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                validate: (p0) {
                  
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
                validate: (p0) {
                  
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
                validate: (p0) {

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
                  validate: (p0) {
                    
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
                    validate: (p0) {
                      
                    },
                  );
                },
              ),
              const SizedBox(
                height: 32,
              ),
              MyButton(onTap: () {
                addUserToFirestore(usernameController.text, emailController.text, passwordController.text, phoneController.text);
              }, title: Tiltes.sign),
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
                                builder: (context) => LoginPage()));
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
   void addUserToFirestore(
        String username, String email, String password, String phone) {
      userAdditionCubit.addUserToFirestore(username, email, password, phone);
    }
}
