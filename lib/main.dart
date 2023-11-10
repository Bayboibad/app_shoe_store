

import 'package:app_shoe_store/provider/provider_category.dart';
import 'package:app_shoe_store/provider/provider_product.dart';
import 'package:app_shoe_store/firebase_options.dart';
import 'package:app_shoe_store/provider/suffix_icon_field.dart';
import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/splash_screen.dart';
import 'package:app_shoe_store/validate/validate_user.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
const kWebRecaptchaSiteKey = '6LedhAkpAAAAADjKbWyKHrnno6N2XrgUfaDuCirx';
Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Activate app check after initialization, but before
  // usage of any Firebase services.
  await FirebaseAppCheck.instance
      // Your personal reCaptcha public key goes here:
      .activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
    webProvider: ReCaptchaV3Provider(kWebRecaptchaSiteKey),
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
      locale: const Locale('en'),
      theme: themeProvider.currentTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashSreen(),
    );
  }
}
