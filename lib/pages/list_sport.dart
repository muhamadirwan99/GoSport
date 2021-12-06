import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/sport_model.dart';

class ListSportPage extends StatefulWidget {
  const ListSportPage({Key? key}) : super(key: key);

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
            FutsalItem(),
            BadmintonItem(),
            BasketItem(),
          ],
        ),
      ),
    );
  }

  Widget FutsalItem() {
    return Card(
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

  Widget BadmintonItem() {
    return Card(
      margin: EdgeInsets.only(top: 30),
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

  Widget BasketItem() {
    return Card(
      margin: EdgeInsets.only(top: 30),
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
