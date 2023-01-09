import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_signin_ui/blocs/auth_blocs/auth_bloc.dart';
import 'package:login_signin_ui/components/rounded_button.dart';
import 'package:login_signin_ui/constants.dart';
import 'package:login_signin_ui/firebase_repositories/authentication_repo.dart';
import 'package:login_signin_ui/screens/components/background.dart';
import 'package:login_signin_ui/screens/login/login_screen.dart';
import 'package:login_signin_ui/screens/signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
        body: Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Clean Maid',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: kPrimaryColor,
                fontSize: 40,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/cleaning.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider.value(
                        value: authBloc,
                        child: LoginScreen(),
                      );
                    },
                  ),
                );
              },
              text: 'LOGIN',
            ),
            RoundedButton(
              text: 'REGISTER',
              color: kPrimaryLightColor,
              textcolor: Colors.black,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BlocProvider.value(
                    value: authBloc,
                    child: SignupScreen(),
                  );
                }));
              },
            ),
          ],
        ),
      ),
    ));
  }
}
