import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusChangeToNext(BuildContext context, FocusNode current, FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        backgroundColor: Colors.black.withOpacity(0.5), msg: message);
  }

  static flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        duration: const Duration(seconds: 2),
        icon: const Icon(Icons.error),
        showProgressIndicator: false,
        message: message,
        messageSize: 12.0,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(30),
        margin: EdgeInsets.all(15.0),

      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)
        )
    );
  }


}
