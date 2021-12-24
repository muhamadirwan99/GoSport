import 'package:flutter/material.dart';
import 'package:go_sport/common/navigation.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/user_model.dart';
import 'package:go_sport/pages/invoice_page.dart';
import 'package:go_sport/widgets/card_booking.dart';

class OrderPage extends StatelessWidget {
  final UserModel userModel;
  const OrderPage({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Booking/Order',
            style: myTextTheme.headline5,
          ),
        ),
        titleTextStyle: const TextStyle(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigation.intent(Invoice.routeName);
                  },
                  child: const CardBooking()),
            ],
          ),
        ),
      ),
    );
  }
}
