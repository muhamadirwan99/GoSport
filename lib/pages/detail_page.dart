import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/transactions_model.dart';
import 'package:go_sport/data/model/user_model.dart';
import 'package:go_sport/utils/detail_arguments.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detailPage';

  DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DateTime selectDate = DateTime.now();
  String dateFormat = "";

  UserModel userModel = UserModel();
  TransactionsModel transactionsModel = TransactionsModel();

  // final currentUser = FirebaseAuth.instance.currentUser;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference transactions =
      FirebaseFirestore.instance.collection('transactions');

  @override
  void initState() {
    dateFormat = DateFormat("dd-MM-yyy").format(selectDate);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;

    return Scaffold(
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: getData(args.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var fieldDetail = snapshot.data!.data() as Map<String, dynamic>;
            return NestedScrollView(
              headerSliverBuilder: (context, isScrolled) {
                return [
                  SliverAppBar(
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    expandedHeight: 180,
                    backgroundColor: const Color(0xFFFAFAFA),
                    foregroundColor: secondaryColor,
                    flexibleSpace: FlexibleSpaceBar(
                      background: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24)),
                        child: Image.network(fieldDetail["imagesDetail"],
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 12, top: 12),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 14),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              fieldDetail["name"],
                              style: myTextTheme.headline4,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.place, size: 20),
                              Text(fieldDetail["place"],
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, top: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 28,
                                        color: Colors.yellow,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        fieldDetail["ratings"].toString(),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 28),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Ratings',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.access_time_filled,
                                        size: 28,
                                        color: secondaryColor,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        fieldDetail["open"],
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${fieldDetail["timeOpen"]} am - ${fieldDetail["timeClose"]} pm',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 48, top: 16, bottom: 10, right: 30),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Detail',
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              fieldDetail["detail"],
                              style: myTextTheme.bodyText1,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 17, right: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'IDR ${NumberFormat.compact().format(fieldDetail["price"])} / Hour',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: secondaryColor,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              DatePicker.showDateTimePicker(
                                context,
                                showTitleActions: true,
                                minTime: selectDate,
                                onConfirm: (date) {
                                  setState(() {
                                    selectDate = date;
                                    addTransc();
                                  });
                                },
                              );
                            },
                            child: Text(
                              'Book Now',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: secondaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;
    if (args.sportName == 'futsal') {
      DocumentReference docRef = firestore.collection("futsal").doc(docID);
      return docRef.get();
    } else if (args.sportName == 'basket') {
      DocumentReference docRef = firestore.collection("basket").doc(docID);
      return docRef.get();
    } else {
      DocumentReference docRef = firestore.collection("tenis").doc(docID);
      return docRef.get();
    }
  }

  Future<void> addTransc() async {
    TransactionsModel transactionsModel = TransactionsModel();
    final currentUser = FirebaseAuth.instance.currentUser;

    transactionsModel.username = userModel.username;
    userModel.uid;
    userModel.username;
    selectDate.day.toString();

    if (currentUser != null) {
      await firestore
          .collection('transactions')
          .doc()
          .set(transactionsModel.toMap());
      const snackbar = SnackBar(content: Text("Transactions Successfully"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      Navigator.pop(context);
    }
  }
}

// postDetailsToFirestore() async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;

//     UserModel userModel = UserModel();
//     userModel.email = user!.email;
//     userModel.uid = user.uid;
//     userModel.fullname = fullnameEditingController.text;
//     userModel.username = usernameEditingController.text.toLowerCase();

//     await firebaseFirestore
//         .collection("users")
//         .doc(user.uid)
//         .set(userModel.toMap());

//     const snackbar = SnackBar(content: Text("Resgister Successfully"));
//     ScaffoldMessenger.of(context).showSnackBar(snackbar);
//     Navigator.pop(context);
//   }