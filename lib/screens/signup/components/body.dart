// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:login_signin_ui/components/already_have_an_account_acheck.dart';
// import 'package:login_signin_ui/components/rounded_button.dart';
// import 'package:login_signin_ui/components/rounded_input_field.dart';
// import 'package:login_signin_ui/components/rounded_password_field.dart';
// import 'package:login_signin_ui/constants.dart';
// import 'package:login_signin_ui/screens/login/login_screen.dart';
// import 'package:login_signin_ui/screens/signup/components/background.dart';
// import 'package:login_signin_ui/screens/signup/components/round_social_button.dart';

// class Body extends StatelessWidget {
//   final Widget child;
//   const Body({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(
//         child: SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'SIGNUP',
//             style: TextStyle(
//               fontWeight: FontWeight.w900,
//               color: kPrimaryColor,
//               fontSize: 20,
//             ),
//           ),
//           SizedBox(height: size.height * 0.03),
//           SvgPicture.asset(
//             'assets/icons/my_registration.svg',
//             height: size.height * 0.35,
//           ),
//           RoundedInputField(
//             hintText: 'Your Email',
//             onChanged: (value) {},
//           ),
//           RoundedPasswordField(onChanged: (value) {}),
//           RoundedButton(text: 'SIGNUP', press: () {}),
//           SizedBox(height: size.height * 0.03),
//           AlreadyHaveAnAccountCheck(
//               login: false,
//               press: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return const LoginScreen();
//                 }));
//               }),
//         ],
//       ),
//     ));
//   }
// }
