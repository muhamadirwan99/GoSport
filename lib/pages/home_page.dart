import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_sport/common/navigation.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/user_model.dart';
import 'package:go_sport/pages/menu_list_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final UserModel userModel;

  const HomePage({Key? key, required this.userModel}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          // stream: null,
          builder: (context, snapshot) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                Expanded(
                  flex: 0,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'GoSport',
                          style: GoogleFonts.montserrat(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Please order below',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      futsalItem(),
                      tenisItem(),
                      basketItem(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget futsalItem() {
    return InkWell(
      onTap: () {
        Navigation.intentWithData(MenuListPage.routeName, 'futsal');
      },
      child: Card(
        margin: const EdgeInsets.only(top: 10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            InkWell(
              child: Image.asset(
                'assets/images/futsal.png',
              ),
              onTap: () {
                Navigation.intentWithData(MenuListPage.routeName, 'futsal');
              },
            ),
            Text(
              'Futsal',
              style: TextStyle(
                  fontWeight: bold, color: Colors.white, fontSize: 36),
            ),
          ],
        ),
      ),
    );
  }

  Widget tenisItem() {
    return InkWell(
      onTap: () {
        Navigation.intentWithData(MenuListPage.routeName, 'tennis');
      },
      child: Card(
        margin: const EdgeInsets.only(top: 20),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            InkWell(
              child: Image.asset(
                'assets/images/tenis.png',
              ),
              onTap: () {
                Navigation.intentWithData(MenuListPage.routeName, 'tennis');
              },
            ),
            Text(
              'Tennis',
              style: TextStyle(
                  fontWeight: bold, color: Colors.white, fontSize: 36),
            ),
          ],
        ),
      ),
    );
  }

  Widget basketItem() {
    return InkWell(
      onTap: () {
        Navigation.intentWithData(MenuListPage.routeName, "basket");
      },
      child: Card(
        margin: const EdgeInsets.only(top: 20),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            InkWell(
              child: Image.asset(
                'assets/images/basket.png',
              ),
              onTap: () {
                Navigation.intentWithData(MenuListPage.routeName, "basket");
              },
            ),
            Text(
              'Basket',
              style: TextStyle(
                  fontWeight: bold, color: Colors.white, fontSize: 36),
            ),
          ],
        ),
      ),
    );
  }
}
