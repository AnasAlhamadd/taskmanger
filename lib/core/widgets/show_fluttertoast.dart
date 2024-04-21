import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String msg, required ToastState toastState}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: getColor(toastState),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { success, error, warning }

Color getColor(ToastState toastState) {
  switch (toastState) {
    case ToastState.success:
      return const Color(0xff41B06E);
    case ToastState.error:
<<<<<<< HEAD
      return Colors.red;
=======
      return const Color(0xff41B06E);
>>>>>>> 232d53587cde2b51779a7c158a2cc55f881fe7a1
    case ToastState.warning:
      return const Color(0xffC70039);
  }
}
