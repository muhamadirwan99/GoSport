import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/widgets/card_favorite.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            children: [
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
