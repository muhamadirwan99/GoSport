import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/pages/edit_profile_page.dart';
import 'package:go_sport/pages/home_page.dart';
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
      debugShowCheckedModeBanner: false,
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
      initialRoute: 'splash-page',
      routes: {
        'splash-page': (context) => SplashPage(),
        '/signInPage': (context) => SignInPage(),
        '/signUpPage': (context) => SignUpPage(),
        '/homePage': (context) => HomePage(),
        MenuPage.routeName: (context) => MenuPage(),
      },
    );
  }
}
