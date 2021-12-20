import 'package:flutter/material.dart';
import 'package:go_sport/pages/sign_in_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/SplashPage';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SplashScreenView(
      navigateRoute: const SignInPage(),
      duration: 4000,
      imageSize: 400,
      imageSrc: "assets/images/splash.png",
      backgroundColor: Colors.white,
    ));
  }
}
