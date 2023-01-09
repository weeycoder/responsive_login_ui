import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_signin_ui/blocs/auth_blocs/auth_bloc.dart';
import 'package:login_signin_ui/components/already_have_an_account_acheck.dart';
import 'package:login_signin_ui/components/rounded_button.dart';
import 'package:login_signin_ui/components/rounded_input_field.dart';
import 'package:login_signin_ui/components/rounded_password_field.dart';
import 'package:login_signin_ui/constants.dart';
import 'package:login_signin_ui/helpers/dialog_utils.dart';
import 'package:login_signin_ui/main.dart';
import 'package:login_signin_ui/models/user_model.dart';
import 'package:login_signin_ui/screens/login/components/background.dart';
import 'package:login_signin_ui/screens/selection_page/selection_page.dart';
import 'package:login_signin_ui/screens/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      body: Background(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailureState) {
              // remove loading dialog
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message), backgroundColor: Colors.red));
            } else if (state is AuthLoadingState) {
              DialogUtil.showLoadingDialog(context);
            } else if (state is AuthSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Welcome ${state.user.email} !'),
                    backgroundColor: Colors.green),
              );
              // remove loading dialog
              navigatorKey.currentState!.popUntil((route) => route.isFirst);
              // navigate to selection page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BlocProvider.value(
                        value: authBloc, child: const SelectionScreen());
                  },
                ),
              );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: kPrimaryColor,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  'assets/icons/login.svg',
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: 'Your Email',
                  controller: emailController,
                ),
                RoundedPasswordField(
                  controller: passwordController,
                ),
                RoundedButton(
                  text: 'LOGIN',
                  press: () {
                    if (emailController.text.trim().isEmpty ||
                        passwordController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please enter all credentials'),
                          backgroundColor: Colors.red));
                      return;
                    } else {
                      UserModel user = UserModel(
                          email: emailController.text,
                          password: passwordController.text);
                      debugPrint("User Model: ${userModelToJson(user)}");
                      authBloc.add(AuthenticatedUserEvent(user));
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignupScreen();
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
