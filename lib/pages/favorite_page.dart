import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/user_model.dart';
import 'package:go_sport/widgets/card_favorite.dart';

class FavoritePage extends StatelessWidget {
  final UserModel userModel;
  const FavoritePage({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Favorite',
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
          padding: const EdgeInsets.only(left: 18, right: 18, top: 150),
          child: Column(
            children: const [
              Text("I'm, Sorry \n     But", style: TextStyle(fontSize: 30)),
              Text("       This page is\n under maintenance \n",
                  style: TextStyle(fontSize: 30)),
              CardFavorite(),
              CardFavorite(),
              CardFavorite(),
              CardFavorite(),
            ],
          ),
        ),
      ),
    );
  }
}
