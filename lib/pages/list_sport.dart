import 'package:flutter/material.dart';
import 'package:go_sport/common/style.dart';
import 'package:go_sport/data/model/sport_model.dart';

class ListSportPage extends StatefulWidget {
  const ListSportPage({Key? key}) : super(key: key);

  @override
  State<ListSportPage> createState() => _ListSportPageState();
}

class _ListSportPageState extends State<ListSportPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 600,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            FutureBuilder<String>(
              future: DefaultAssetBundle.of(context)
                  .loadString("assets/local_sport.json"),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                }
                if (!snapshot.hasData) {
                  return Text('Gagal mengambil data');
                }
                final List<FutsalElement> futsal =
                    futsalFromJson(snapshot.data.toString()).futsal;
                return ListView.builder(
                  itemCount: futsal.length,
                  itemBuilder: (context, index) {
                    return _buildFutsalItem(futsal[index], context);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFutsalItem(FutsalElement futsal, BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          InkWell(
            child: Image.network(
              futsal.pictureId,
            ),
            onTap: () {},
          ),
          Text(
            futsal.name,
            style:
                TextStyle(fontWeight: bold, color: Colors.white, fontSize: 36),
          ),
        ],
      ),
    );
  }
}
