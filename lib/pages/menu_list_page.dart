import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/widgets/card_sport.dart';

class MenuListPage extends StatelessWidget {
  static const routeName = '/menuPage';
  String sportName = '';

  MenuListPage({
    Key? key,
    required this.sportName,
  }) : super(key: key);

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
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                          sportName: sportName,
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

  Stream<QuerySnapshot<Object?>> streamData() {
    if (sportName == 'futsal') {
      return firestore.collection("futsal").snapshots();
    } else if (sportName == 'basket') {
      return firestore.collection("basket").snapshots();
    } else {
      return firestore.collection("tenis").snapshots();
    }
  }
}
