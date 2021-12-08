import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CardBooking extends StatelessWidget {
  CardBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 13),
        padding: const EdgeInsets.only(bottom: 5),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              child: Image.asset('assets/futsal.png'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, top: 8),
              child: Text(
                'Jaya Futsal',
                style: myTextTheme.headline6,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 11, top: 8, right: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.place, size: 12),
                      Text('Cicurug, Sukabumi', style: myTextTheme.subtitle2),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('4.5'.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 11, top: 8, right: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.delete, color: Color(0xffED6363)),
                  Text(
                    'Remove',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xffED6363),
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
}
