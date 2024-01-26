import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Modular.to.navigate('/signIn');
    });

    return MaterialApp(
      home: Scaffold(
        body: SizedBox.expand(
            child: Center(child: Image.asset('assets/logo/splash.png'))),
      ),
    );
  }
}
