import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:google_fonts/google_fonts.dart';

class ListSportPage extends StatefulWidget {
  const ListSportPage({Key? key}) : super(key: key);
  static const routeName = '/listSportPage';

  @override
  State<ListSportPage> createState() => _ListSportPageState();
}

class _ListSportPageState extends State<ListSportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      height: 24,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    futsalItem(),
                    badmintonItem(),
                    basketItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget futsalItem() {
    return Card(
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
            onTap: () {},
          ),
          Text(
            'Futsal',
            style:
                TextStyle(fontWeight: bold, color: Colors.white, fontSize: 36),
          ),
        ],
      ),
    );
  }

  Widget badmintonItem() {
    return Card(
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
              'assets/images/badminton.png',
            ),
            onTap: () {},
          ),
          Text(
            'Badminton',
            style:
                TextStyle(fontWeight: bold, color: Colors.white, fontSize: 36),
          ),
        ],
      ),
    );
  }

  Widget basketItem() {
    return Card(
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
            onTap: () {},
          ),
          Text(
            'Basket',
            style:
                TextStyle(fontWeight: bold, color: Colors.white, fontSize: 36),
          ),
        ],
      ),
    );
  }
}
