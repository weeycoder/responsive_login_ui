import 'package:flutter/material.dart';

class DialogUtil {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
