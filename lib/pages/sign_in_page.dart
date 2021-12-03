import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/pages/home_page.dart';
import 'package:go_sport/pages/sign_up_page.dart';
import 'package:go_sport/pages/menu_page.dart';

class SignInPage extends StatelessWidget {
  static const routeName = '/signInPage';

  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 40, fontWeight: bold),
            ),
            const SizedBox(
              height: 2,
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 46),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Email Address',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 47,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(50, 0, 0, 0),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/ic_email.png',
                      width: 32,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: blur,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Password',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 47,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(50, 0, 0, 0),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/ic_lock.png',
                      width: 32,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: blur,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 69),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, HomePage.routeName);
          },
          style: TextButton.styleFrom(
            backgroundColor: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Sign In',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: medium),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(top: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an account? ',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SignUpPage.routeName);
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: secondaryColor, fontWeight: bold),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              header(),
              emailInput(),
              passwordInput(),
              signInButton(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
