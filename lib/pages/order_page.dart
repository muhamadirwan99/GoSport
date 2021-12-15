import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/widgets/card_booking.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

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
            children: const [
              CardBooking(),
              CardBooking(),
              CardBooking(),
            ],
          ),
        ),
      ),
    );
  }
}
