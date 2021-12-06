import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/pages/detail_page.dart';
import 'package:go_sport/pages/sign_in_page.dart';

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
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo Dista',
                        style: TextStyle(fontSize: 28, fontWeight: semiBold),
                      ),
                      Text(
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

    Widget MenuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Icon(
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
              SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: TextStyle(fontWeight: bold, fontSize: 20),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signInPage');
                  },
                  child: MenuItem('Edit Profile')),
              MenuItem('Your Orders'),
              MenuItem('Help'),
              SizedBox(
                height: defaultMargin,
              ),
              Text(
                'General',
                style: TextStyle(fontWeight: bold, fontSize: 20),
              ),
              MenuItem('Privacy & Policy'),
              MenuItem('Term of Service'),
              MenuItem('Rate App'),
              Center(
                child: Container(
                  height: 50,
                  width: 300,
                  margin: EdgeInsets.only(top: 50),
                  child: TextButton(
                    onPressed: () {},
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

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
