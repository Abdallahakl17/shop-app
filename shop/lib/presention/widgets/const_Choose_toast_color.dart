import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String tex, required States color}) =>
    Fluttertoast.showToast(
        msg: tex,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: chooseColor(color),
        textColor: Colors.white,
        fontSize: 16.0);

enum States { succes, erorr, warning }

Color chooseColor(States stat) {
  Color color;
  switch (stat) {
    case States.succes:
      color = Colors.green;
      break;
    case States.erorr:
      color = Colors.red;
      break;
    case States.warning:
      color = Colors.amber;
      break;
  }
  return color;
}
