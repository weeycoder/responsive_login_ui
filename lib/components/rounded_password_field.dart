import 'package:flutter/material.dart';
import 'package:login_signin_ui/components/text_field_container.dart';
import 'package:login_signin_ui/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  const RoundedPasswordField({
    Key? key,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      onChanged: onChanged,
      controller: controller,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
        hintText: 'Password',
        icon: Icon(Icons.lock, color: kPrimaryColor),
        suffix: Icon(
          Icons.visibility,
          color: kPrimaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
