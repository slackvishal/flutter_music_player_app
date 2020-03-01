import 'package:flutter/material.dart';
import 'package:flutter_music_player_app/SizeConfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'HomeScreen App',
              home: Albums(),
            );
          },
        );
      },
    );
  }
}

class Albums extends StatefulWidget {
  Albums({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Container(
                height: 27 * SizeConfig.heightMultiplier,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _albumCard("assets/billiebadguy.jpg"),
                    SizedBox(width: 10.0,),
                    _albumCard("assets/godzillaeminem.png"),
                    SizedBox(width: 10.0,),
                    _albumCard("assets/notimetodiebe.jpg"),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 40.0),
              child: Text("Playlists", style: TextStyle(
                color: Colors.black,
                fontFamily: 'Nunito-Regular',
                fontSize: 3.8 * SizeConfig.textMultiplier
              ),),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    playListCard("assets/notimetodiebe.jpg", "No Time To Die", "Billie Eilish", "4:02"),
                    SizedBox(height: 20.0,),
                    playListCard("assets/dontdualipa.jpg", "Don\'t start now", "Dua Lipa", "4:02"),
                    SizedBox(height: 20.0,),
                    playListCard("assets/notimetodiebe.jpg", "Godzilla", "Eminem", "4:02"),
                    SizedBox(height: 20.0,),
                    playListCard("assets/bellyache.jpeg", "Belly Ache", "Billie Eilish", "4:02"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }

  _albumCard(String assetImg) {
    return Container(
      height: 27 * SizeConfig.heightMultiplier,
      width: 40 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(assetImg, fit: BoxFit.cover, height: 27 * SizeConfig.heightMultiplier,width: 40 * SizeConfig.widthMultiplier, ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              child: Icon(Icons.play_arrow, color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }

  playListCard(String asset, String albumName, String artist, String duration) {
    return Container(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(asset, fit: BoxFit.cover, height: 12 * SizeConfig.imageSizeMultiplier, width: 12 * SizeConfig.imageSizeMultiplier,),
          ),
          SizedBox(width: 20.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(albumName, style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 2 * SizeConfig.textMultiplier,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),),
              Text(artist, style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 1.7 * SizeConfig.textMultiplier,
                  color: Colors.black,
              ),),
            ],
          ),
          Spacer(),
          Text(duration, style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 2.3 * SizeConfig.textMultiplier,
            color: Colors.black
          ),),
          SizedBox(width: 20.0,),
          Icon(Icons.favorite_border, color: Colors.black,)
        ],
      ),
    );
  }
}