import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/field_model.dart';
import 'package:go_sport/data/model/sport_model.dart';
import 'package:go_sport/widgets/card_sport.dart';
import 'package:flutter/services.dart' as _rootbundle;

class MenuPage extends StatelessWidget {
  static const routeName = '/menuPage';
  final _searchController = TextEditingController();

  MenuPage({Key? key}) : super(key: key);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
              child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: streamData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var field = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: field.length,
                      itemBuilder: (context, index) {
                        return CardSport(
                          id: field[index].id,
                          field: (field[index].data() as Map<String, dynamic>),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
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

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference field = firestore.collection("futsal");
    return field.snapshots();
  }
}
