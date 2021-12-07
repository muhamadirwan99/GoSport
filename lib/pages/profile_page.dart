import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/pages/detail_page.dart';
import 'package:go_sport/pages/edit_profile_page.dart';
import 'package:go_sport/pages/sign_in_page.dart';
import 'package:go_sport/pages/splash_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
                        'Hallo Dista',
                        style: TextStyle(fontSize: 28, fontWeight: semiBold),
                      ),
                      const Text(
                        '@Dstaa',
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
              menuItem('Privacy & Policy'),
              menuItem('Term of Service'),
              menuItem('Rate App'),
              Center(
                child: Container(
                  height: 50,
                  width: 300,
                  margin: EdgeInsets.only(top: 30),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SplashPage.routeName);
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
}
