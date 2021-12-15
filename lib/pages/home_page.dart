import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/user_model.dart';
import 'package:go_sport/pages/favorite_page.dart';
import 'package:go_sport/pages/list_sport.dart';
import 'package:go_sport/pages/order_page.dart';
import 'package:go_sport/pages/profile_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

var indexBottomNav = 0;
List<Widget> widgetOptions = [
  const ListSportPage(),
  const OrderPage(),
  const FavoritePage(),
  const ProfilePage()
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) => {loggedInUser = UserModel.fromMap(value.data())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            selectedColor: bottomNav,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.list_rounded),
            title: const Text('Order'),
            selectedColor: bottomNav,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border_rounded),
            title: const Text('Favorite'),
            selectedColor: bottomNav,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.account_circle_rounded),
            title: const Text('Profile'),
            selectedColor: bottomNav,
          ),
        ],
      ),
    );
  }
}
