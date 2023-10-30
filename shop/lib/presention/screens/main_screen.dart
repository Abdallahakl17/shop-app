import 'package:flutter/material.dart';
import 'package:shop/data/caching/cach_helper.dart';
import 'package:shop/presention/screens/login.dart';
import 'package:shop/presention/screens/on_boarding.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akl Store'),
      ),
       
    );
  }
}
