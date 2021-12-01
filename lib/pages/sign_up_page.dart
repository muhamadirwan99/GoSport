import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/pages/sign_in_page.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = '/signUpPage';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 32),
        child: Column(
          children: [
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 40, fontWeight: bold),
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Full Name',
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
                      'assets/images/ic_fn.png',
                      width: 32,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Full Name',
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

    Widget userInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Username',
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
                      'assets/images/ic_un.png',
                      width: 32,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Username',
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

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
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
        margin: EdgeInsets.only(top: 20),
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

    Widget signUpButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, SignInPage.routeName);
          },
          style: TextButton.styleFrom(
            backgroundColor: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Sign Up',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: medium),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account? ',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SignInPage.routeName);
              },
              child: Text(
                'Sign In',
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
              nameInput(),
              userInput(),
              emailInput(),
              passwordInput(),
              signUpButton(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
