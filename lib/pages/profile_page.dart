import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_sport/common/navigation.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/user_model.dart';
import 'package:go_sport/pages/sign_in_page.dart';
import 'package:go_sport/pages/term_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pp_page.dart';

class ProfilePage extends StatelessWidget {
  final UserModel userModel;

  const ProfilePage({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/gosport-134f8.appspot.com/o/assets%2Fbanner2.png?alt=media&token=3577ccd6-5e0d-4635-adfa-a2449ea327b9',
                    fit: BoxFit.fill,
                  ),
                ),
                SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(top: 1.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: const SizedBox(
                            height: 45,
                          ),
                        ),
                        Image.asset(
                          'assets/images/profile.png',
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.06),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'FullName',
                      style:
                          TextStyle(fontWeight: semiBold, color: Colors.grey),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      userModel.fullname.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      'Username',
                      style:
                          TextStyle(fontWeight: semiBold, color: Colors.grey),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      userModel.username.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      'Email',
                      style:
                          TextStyle(fontWeight: semiBold, color: Colors.grey),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      userModel.email.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  const Divider(color: Colors.black),
                  GestureDetector(
                    onTap: () {
                      Navigation.intent(PolicyPage.routeName);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 18, bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Privacy & Policy',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigation.intent(TermsPage.routeName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Terms & Conditions',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => logout(context),
                      child: Text(
                        'LOGOUT',
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      ),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.redAccent),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Are you sure?',
          style: Theme.of(context).textTheme.headline6,
        ),
        content: Text(
          'Do you want Logout?',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        actions: [
          TextButton(
            child: const Text("CANCEL"),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            style: TextButton.styleFrom(
              primary: Colors.blue,
              backgroundColor: Colors.transparent,
              textStyle: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const SizedBox(width: 1),
          ElevatedButton(
            child: const Text("LOGOUT"),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigation.intentAndReplace(SignInPage.routeName);
            },
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.redAccent,
              textStyle: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
