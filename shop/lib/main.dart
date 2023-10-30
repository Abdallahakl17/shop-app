import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shop/app/them.dart';
import 'package:shop/data/api/api_helper.dart';
import 'package:shop/data/caching/cach_helper.dart';
import 'package:shop/data/cubit/cubit_rev.dart';
import 'package:shop/presention/screens/login.dart';
import 'package:shop/presention/screens/main_screen.dart';
import 'package:shop/presention/screens/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();

  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  Bloc.observer = MyBlocObserver();
  await ApiHelper.intia();
  bool isBording = CachHelper.getDataPref(key: 'onBoarding');
  var token = CachHelper.getDataPref(key: 'token');
  print(token);
  Widget? widget;
  if (isBording != null) {
    if (token != null) {
      widget = const MainScreen();
    } else {
      widget = const Login();
    }
  } else {
    widget = const OnBoarding();
  }

  runApp(MyApp(
    widgetStart: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget widgetStart;

  const MyApp({super.key, required this.widgetStart});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightthemm(),
      home: widgetStart,
    );
  }
}
