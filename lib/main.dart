import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_sport/common/navigation.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/pages/detail_page.dart';
import 'package:go_sport/pages/menu.dart';
import 'package:go_sport/pages/pp_page.dart';
import 'package:go_sport/pages/sign_in_page.dart';
import 'package:go_sport/pages/sign_up_page.dart';
import 'package:go_sport/pages/menu_list_page.dart';
import 'package:go_sport/pages/splash_page.dart';
import 'package:go_sport/pages/term_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final currentUser = FirebaseAuth.instance.currentUser;

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
      initialRoute: currentUser == null ? SplashPage.routeName : Menu.routeName,
      navigatorKey: navigatorKey,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        SignInPage.routeName: (context) => const SignInPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        Menu.routeName: (context) => const Menu(),
        MenuListPage.routeName: (context) => MenuListPage(
              sportName: ModalRoute.of(context)?.settings.arguments as String,
            ),
        DetailPage.routeName: (context) => DetailPage(),
        PolicyPage.routeName: (context) => const PolicyPage(),
        TermsPage.routeName: (context) => const TermsPage(),
      },
    );
  }
}
