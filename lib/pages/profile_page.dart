import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/user_model.dart';
import 'package:go_sport/pages/edit_profile_page.dart';
import 'package:go_sport/pages/pp_page.dart';
import 'package:go_sport/pages/sign_in_page.dart';
import 'package:go_sport/pages/splash_page.dart';
import 'package:go_sport/pages/term_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) => {this.loggedInUser = UserModel.fromMap(value.data())});
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/profile.png',
                    width: 64,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${loggedInUser.fullname}',
                        style: TextStyle(fontSize: 20, fontWeight: semiBold),
                      ),
                      Text(
                        '@${loggedInUser.username}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.black,
            )
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: TextStyle(fontWeight: bold, fontSize: 20),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, EditProfilePage.routeName);
                  },
                  child: menuItem('Edit Profile')),
              menuItem('Your Orders'),
              menuItem('Help'),
              SizedBox(
                height: defaultMargin,
              ),
              Text(
                'General',
                style: TextStyle(fontWeight: bold, fontSize: 20),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PolicyPage.routeName);
                  },
                  child: menuItem('Privacy & Policy')),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, TermsPage.routeName);
                  },
                  child: menuItem('Terms & Conditions')),
              Center(
                child: Container(
                  height: 50,
                  width: 300,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextButton(
                    onPressed: () {
                      logout(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: medium),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SignInPage()));
  }
}
