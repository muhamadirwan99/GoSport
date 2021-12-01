import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/widgets/card_sport.dart';

class MenuPage extends StatelessWidget {
  static const routeName = '/menuPage';
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Find a sports field',
            style: myTextTheme.headline5,
          ),
        ),
        titleTextStyle: TextStyle(color: Colors.black),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 44,
              child: TextField(
                controller: _searchController,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            CardSport(),
          ],
        ),
      ),
    );
  }
}
