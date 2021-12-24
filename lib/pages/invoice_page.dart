import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_sport/common/navigation.dart';
import 'package:go_sport/common/style.dart';
import 'package:google_fonts/google_fonts.dart';

class Invoice extends StatelessWidget {
  static const routeName = '/invoicePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigation.back();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Invoice',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Place',
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Text('Double Futsal',
                            style: GoogleFonts.montserrat(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date',
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Text('25 December 2021',
                            style: GoogleFonts.montserrat(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Time',
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Text('16:00',
                            style: GoogleFonts.montserrat(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price',
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Text('Rp 100.000',
                            style: GoogleFonts.montserrat(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                child: Text(
                    'Please show this page to the officer in the field to make payment',
                    style: GoogleFonts.montserrat(fontStyle: FontStyle.italic)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
