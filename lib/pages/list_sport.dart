import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';

class ListSportPage extends StatefulWidget {
  const ListSportPage({Key? key}) : super(key: key);
  static const routeName = '/listSportPage';

  @override
  State<ListSportPage> createState() => _ListSportPageState();
}

class _ListSportPageState extends State<ListSportPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'GoSport',
            style:
                TextStyle(fontSize: 25, fontWeight: bold, color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            futsalItem(),
            badmintonItem(),
            basketItem(),
          ],
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
