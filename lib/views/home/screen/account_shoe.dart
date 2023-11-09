import 'package:app_shoe_store/composents/my_button.dart';
import 'package:app_shoe_store/composents/my_text_form.dart';
import 'package:app_shoe_store/configs/colors.dart';
import 'package:app_shoe_store/provider/suffix_icon_field.dart';
import 'package:app_shoe_store/services/firebase_auth.dart';
import 'package:app_shoe_store/validate/validate_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileShoe extends StatefulWidget {
  final String username;
  final String email;
  final String phone;
  final String password;
  final String address;
  const ProfileShoe(
      {super.key,
      required this.username,
      required this.email,
      required this.phone,
      required this.password,
      required this.address});

  @override
  State<ProfileShoe> createState() => _ProfileShoeState();
}

class _ProfileShoeState extends State<ProfileShoe> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<void> _updateUser(String name, String email, String pass, String phone,
      String address) async {
    if (_formKey.currentState!.validate()) {
      try {
        Map<String, dynamic> updatedData = {
          "username": name,
          "email": email,
          "password": pass,
          "phone": phone,
          "address": address,
          "status": true,
        };
        String documentId = FirebaseAuth.instance.currentUser!.uid;

        await FirebaseAuthUser().updateUserData(documentId, updatedData);
      } catch (e) {
        print("Lỗi");
      }
    }
  }

  var enbale = false;
  void _enble() {
    enbale = !enbale;
  }

  @override
  Widget build(BuildContext context) {
    var validate = Provider.of<MyValidate>(context);
    final suffixIconProvider = Provider.of<SuffixIconProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.account_circle,
                  size: 80,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  MyTextFormField(
                    controller: usernameController,
                    enabled: enbale,
                    hintText: widget.username.toString(),
                    obscureText: false,
                    icons: Icon(Icons.account_circle_rounded),
                    iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.transparent,
                      ),
                    ),
                    onValidate: (p0) {
                      return validate.validateName(p0);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MyTextFormField(
                    controller: emailController,
                    enabled: enbale,
                    hintText: widget.email.toString(),
                    obscureText: false,
                    icons: Icon(Icons.email),
                    iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.transparent,
                      ),
                    ),
                    onValidate: (p0) {
                      return validate.validateEmail(p0);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MyTextFormField(
                    controller: phoneController,
                    enabled: enbale,
                    hintText: widget.phone.toString(),
                    obscureText: false,
                    icons: const Icon(Icons.phone),
                    iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.transparent,
                      ),
                    ),
                    onValidate: (p0) {
                      return validate.validatePhone(p0);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MyTextFormField(
                    controller: passwordController,
                    enabled: enbale,
                    hintText: widget.password.toString(),
                    obscureText: suffixIconProvider.isPasswordVisibleAccount,
                    icons: const Icon(Icons.lock),
                    iconButton: IconButton(
                      onPressed: () {
                        suffixIconProvider.togglePasswordVisibilityAcount();
                      },
                      icon: Icon(
                        suffixIconProvider.isPasswordVisibleAccount
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    onValidate: (p0) {
                      return validate.validatePassword(p0);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MyTextFormField(
                    controller: addressController,
                    enabled: enbale,
                    hintText: widget.address.toString(),
                    obscureText: false,
                    icons: Icon(Icons.location_on),
                    iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.transparent,
                      ),
                    ),
                    onValidate: (p0) {
                      if (p0!.length == "") {
                        return "Vui lòng nhập địa chỉ";
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: MyButton(
                          onTap: () {
                            setState(() {
                              _enble();
                            });
                          },
                          title: "Sửa"),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: MyButton(
                            onTap: () {
                              if (enbale == true) {
                                _updateUser(
                                    usernameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    phoneController.text,
                                    addressController.text);
                                    showCustomDialog(context, "Sửa thành công");
                              }else{
                                showCustomDialog(context,"Bạn chưa nhấn nút sửa để sửa.");
                              }
                            },
                            title: "cập nhật")),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Thông báo'),
        content:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text.toString()),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close',style: TextStyle(color: AppColors.BackgroudApp)),
          ),
        ],
      );
    },
  );
}
