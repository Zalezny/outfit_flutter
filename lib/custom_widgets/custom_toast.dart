import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  void showToast(String text) {
    FToast().showToast(
        toastDuration: const Duration(milliseconds: 500),
        child: Material(
          color: Colors.white,
          child: Row(children: [
            Image.asset('assets/images/ic_launcher.png'),
            Text(
              text,
              style: const TextStyle(color: Colors.black87, fontSize: 16),
            )
          ]),
        ));
  }
}
