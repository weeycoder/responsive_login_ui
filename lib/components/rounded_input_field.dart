import 'package:flutter/material.dart';
import 'package:login_signin_ui/components/text_field_container.dart';
import 'package:login_signin_ui/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
