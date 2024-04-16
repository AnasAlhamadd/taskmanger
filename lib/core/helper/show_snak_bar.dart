import 'package:flutter/material.dart';

void showsnackbar({required BuildContext context, required String title}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(title),
  ));
}
