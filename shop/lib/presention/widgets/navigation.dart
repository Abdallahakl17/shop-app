import 'package:flutter/material.dart';

extension Navigat on BuildContext {
  navigatTo(Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }
}

extension NavigatRemove on BuildContext {
  navigatAndRemove(Widget screen) {
    Navigator.pushAndRemoveUntil(this,
        MaterialPageRoute(builder: (context) => screen), (route) => false);
  }
}
