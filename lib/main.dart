import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signin_ui/blocs/auth_blocs/auth_bloc.dart';
import 'package:login_signin_ui/constants.dart';
import 'package:login_signin_ui/firebase_repositories/authentication_repo.dart';
import 'package:login_signin_ui/helpers/shared_preferences.dart';
import 'package:login_signin_ui/screens/selection_page/selection_page.dart';
import 'package:login_signin_ui/screens/welcomes/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSharedPreferences.init();
  await Firebase.initializeApp();
  runApp(RepositoryProvider(
    create: (context) => AuthenticationRepository(),
    child: BlocProvider(
      create: (context) => AuthBloc(context.read<AuthenticationRepository>()),
      child: MyApp(),
    ),
  ));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: kPrimaryColor,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 48),
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: kPrimaryColor,
          iconColor: kPrimaryColor,
          prefixIconColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: _firebaseAuth.currentUser != null
          ? const SelectionScreen()
          : const WelcomeScreen(),
    );
  }
}
