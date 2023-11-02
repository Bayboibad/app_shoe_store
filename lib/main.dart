
import 'package:app_shoe_store/bloc/loading_bloc.dart';
import 'package:app_shoe_store/bloc/user_bloc.dart';
import 'package:app_shoe_store/firebase_options.dart';
import 'package:app_shoe_store/provider/suffix_icon_field.dart';
import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/views/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 6666);
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider<SuffixIconProvider>(
            create: (context) => SuffixIconProvider(),
          ),
          // Các Provider khác nếu cần
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoadingBloc(),
            ),
            BlocProvider(create: (context) => UserAdditionCubit())
          ],
          child: const MyApp(),
        )),
  );
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
      home: LoginPage(),
    );
  }
}
