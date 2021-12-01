import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/pages/sign_in_page.dart';
import 'package:go_sport/pages/sign_up_page.dart';
import 'package:go_sport/pages/splash_page.dart';
import 'package:go_sport/pages/menu_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoSport',
      theme: ThemeData(
        primaryColor: secondaryColor,
        primaryColorDark: secondaryColor,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        textTheme: myTextTheme,
      ),
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        SignInPage.routeName: (context) => const SignInPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        MenuPage.routeName: (context) => MenuPage(),
      },
    );
  }
}
