import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/pages/favorite_page.dart';
import 'package:go_sport/pages/list_sport.dart';
import 'package:go_sport/pages/order_page.dart';
import 'package:go_sport/pages/profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

var indexBottomNav = 0;
List<Widget> widgetOptions = [
  ListSportPage(),
  OrderPage(),
  FavoritePage(),
  ProfilePage()
];

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const routeName = '/homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: widgetOptions.elementAt(indexBottomNav),
        bottomNavigationBar: SalomonBottomBar(
          onTap: (index) {
            setState(
              () {
                indexBottomNav = index;
              },
            );
          },
          currentIndex: indexBottomNav,
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              selectedColor: bottomNav,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.list_rounded),
              title: Text('Order'),
              selectedColor: bottomNav,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              title: Text('Favorite'),
              selectedColor: bottomNav,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.account_circle_rounded),
              title: Text('Profile'),
              selectedColor: bottomNav,
            ),
          ],
        ),
      ),
    );
  }
}
