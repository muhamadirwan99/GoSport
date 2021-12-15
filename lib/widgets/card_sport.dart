import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/pages/detail_page.dart';
import 'package:go_sport/utils/detail_arguments.dart';

// ignore: must_be_immutable
class CardSport extends StatelessWidget {
  Map<String, dynamic> field;
  String id = "";
  String sportName = '';

  CardSport(
      {Key? key,
      required this.field,
      required this.id,
      required this.sportName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName,
              arguments: DetailArguments(id, sportName));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.only(bottom: 8),
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
                child: Image.network(field["images"]),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, top: 8),
                child: Text(
                  field["name"],
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
                        Text(field["place"], style: myTextTheme.subtitle2),
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
                        Text(field["ratings"].toString(),
                            style: const TextStyle(
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
