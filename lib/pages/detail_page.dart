import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detailPage';

  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              expandedHeight: 180,
              backgroundColor: const Color(0xFFFAFAFA),
              foregroundColor: secondaryColor,
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24)),
                  child: Image.asset(
                    'assets/futsal_detail.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 12, top: 12),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 14),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Jaya Futsal',
                        style: myTextTheme.headline4,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.place, size: 20),
                        Text('Cicurug, Sukabumi',
                            style: GoogleFonts.montserrat(
                                fontSize: 20, fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.black),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 28,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '4.5',
                                  style: GoogleFonts.montserrat(fontSize: 28),
                                ),
                              ],
                            ),
                            Text(
                              'Ratings',
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.access_time_filled,
                                  size: 28,
                                  color: secondaryColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Mon - Sun',
                                  style: GoogleFonts.montserrat(fontSize: 20),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                '8 am - 22 pm',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(color: Colors.black),
              Padding(
                padding: const EdgeInsets.only(
                    left: 48, top: 16, bottom: 10, right: 30),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Detail',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac pretium amet eget tortor eget accumsan congue. Quis magna urna a leo. Id placerat nisi fringilla dolor, scelerisque sit purus diam venenatis. Blandit et dictumst nisl, ultrices ullamcorper.',
                        style: myTextTheme.bodyText1,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'IDR 200K / Hour',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Book Now',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: secondaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
