import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/sport_model.dart';
import 'package:go_sport/pages/detail_page.dart';

class CardSport extends StatelessWidget {
  FutsalElement sport;

  CardSport({required this.sport});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailPage.routeName,
          );
        },
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
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Image.network(sport.pictureId),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, top: 8),
                child: Text(
                  sport.name,
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
                        Icon(Icons.place, size: 12),
                        Text(sport.address, style: myTextTheme.subtitle2),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(sport.ratings.toString(),
                            style: TextStyle(
                              fontSize: 13,
                            )),
                      ],
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
