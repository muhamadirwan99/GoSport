import 'package:flutter/material.dart';
import 'package:go_sport/common/styles.dart';
import 'package:go_sport/ui/menu_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoSport',
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
        ),
        textTheme: myTextTheme,
      ),
      initialRoute: MenuPage.routeName,
      routes: {
        MenuPage.routeName: (context) => MenuPage(),
      },
    );
  }
}
