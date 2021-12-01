import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_sport/pages/sign_in_page.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, SignInPage.routeName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 242,
          height: 242,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash.png'),
            ),
          ),
        ),
      ),
    );
  }
}
