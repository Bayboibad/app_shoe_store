

import 'package:app_shoe_store/provider/provider_category.dart';
import 'package:app_shoe_store/provider/provider_product.dart';
import 'package:app_shoe_store/firebase_options.dart';
import 'package:app_shoe_store/provider/suffix_icon_field.dart';
import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/validate/validate_user.dart';
import 'package:app_shoe_store/views/login/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider<SuffixIconProvider>(
        create: (context) => SuffixIconProvider(),
      ),
      ChangeNotifierProvider<MyValidate>(create: (context) => MyValidate()),
      ChangeNotifierProvider<ProviderProductShoe>(
          create: (context) => ProviderProductShoe()),
      ChangeNotifierProvider<CategoryProvider>(create: (context) => CategoryProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeProvider.currentTheme,
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}
