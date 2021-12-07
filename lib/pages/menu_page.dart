import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/sport_model.dart';
import 'package:go_sport/widgets/card_sport.dart';
import 'package:flutter/services.dart' as _rootbundle;

class MenuPage extends StatelessWidget {
  static const routeName = '/menuPage';
  final _searchController = TextEditingController();

  MenuPage({Key? key}) : super(key: key);

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
        titleTextStyle: const TextStyle(color: Colors.black),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
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
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
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
            ),
            Expanded(
              child: FutureBuilder(
                future: _readJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Text('${data.error}');
                  } else if (data.hasData) {
                    var sport = data.data as List<FutsalElement>;
                    return ListView.builder(
                      itemCount: sport.length,
                      itemBuilder: (context, index) {
                        return CardSport(
                          sport: sport[index],
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<FutsalElement>> _readJsonData() async {
    final jsonData =
        await _rootbundle.rootBundle.loadString('assets/local_sport.json');
    final list = jsonDecode(jsonData);
    List<dynamic> data = list["futsal"];

    return data.map((json) => FutsalElement.fromJson(json)).toList();
  }
}
