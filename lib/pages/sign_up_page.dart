import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/user_model.dart';
import 'package:go_sport/pages/home_page.dart';
import 'package:go_sport/pages/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const routeName = '/signUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final fullnameEditingController = new TextEditingController();
  final usernameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 32),
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
        margin: const EdgeInsets.only(top: 20),
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
                  color: const Color.fromARGB(50, 0, 0, 0),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  children: [
                    const Icon(Icons.person, color: secondaryColor, size: 32),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: fullnameEditingController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Full Name',
                          hintStyle: blur,
                        ),
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{3,}$');
                          if (value!.isEmpty) {
                            return "FullName cannot be empty";
                          }
                          if (!regex.hasMatch(value)) {
                            return "Please Enter FullName (Min. 3 Character)";
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   fullnameEditingController.text = value!;
                        // },
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
        margin: const EdgeInsets.only(top: 20),
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
                    const Icon(Icons.person_pin,
                        color: secondaryColor, size: 32),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: usernameEditingController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Username',
                          hintStyle: blur,
                        ),
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{3,}$');
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   usernameEditingController.text = value!;
                        // },
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
        margin: const EdgeInsets.only(top: 20),
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
                  color: const Color.fromARGB(50, 0, 0, 0),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  children: [
                    const Icon(Icons.email, color: secondaryColor, size: 32),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailEditingController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: blur,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Email";
                          }
                          //reg expression for email validation
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9,-]+.[a-z]")
                              .hasMatch(value)) {
                            return "Please Enter a valid email";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          emailEditingController.text = value!;
                        },
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
        margin: const EdgeInsets.only(top: 20),
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
                    const Icon(Icons.lock, color: secondaryColor, size: 32),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: passwordEditingController,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: blur,
                        ),
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return "Password is required for login";
                          }
                          if (!regex.hasMatch(value)) {
                            return "Please Enter Valid Password(Min. 6 Character)";
                          }
                        },
                        // onSaved: (value) {
                        //   passwordEditingController.text = value!;
                        // },
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
            signUp(emailEditingController.text, passwordEditingController.text);
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
                fontSize: 16, color: Colors.white, fontWeight: medium),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
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
          child: Form(
            key: _formKey,
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
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // callinng our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullname = fullnameEditingController.text;
    userModel.username = usernameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully");
    Navigator.pushNamed(context, SignInPage.routeName);
  }
}
