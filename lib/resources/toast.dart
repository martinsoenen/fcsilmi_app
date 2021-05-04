import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showErrorToast(String message) {
  return Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
  );
}