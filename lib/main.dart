import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/pages/detail_page.dart';
import 'package:go_sport/pages/edit_profile_page.dart';
import 'package:go_sport/pages/home_page.dart';
import 'package:go_sport/pages/pp_page.dart';
import 'package:go_sport/pages/sign_in_page.dart';
import 'package:go_sport/pages/sign_up_page.dart';
import 'package:go_sport/pages/splash_page.dart';
import 'package:go_sport/pages/menu_page.dart';
import 'package:go_sport/pages/term_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        SignInPage.routeName: (context) => const SignInPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        HomePage.routeName: (context) => const HomePage(),
        MenuPage.routeName: (context) => MenuPage(),
        DetailPage.routeName: (context) => const DetailPage(),
        EditProfilePage.routeName: (context) => const EditProfilePage(),
        PolicyPage.routeName: (context) => const PolicyPage(),
        TermsPage.routeName: (context) => const TermsPage(),
      },
    );
  }
}
