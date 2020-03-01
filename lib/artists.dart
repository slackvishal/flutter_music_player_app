import 'package:flutter/material.dart';
import 'package:flutter_music_player_app/SizeConfig.dart';
import 'package:flutter_music_player_app/artistdetail.dart';

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
              home: Artists(),
            );
          },
        );
      },
    );
  }
}

class Artists extends StatefulWidget {
  Artists({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Container(
              height: 20 * SizeConfig.heightMultiplier,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ArtistsDetail()));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 24 * SizeConfig.widthMultiplier,
                          height: 12 * SizeConfig.heightMultiplier,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/billie.jpg"))
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text("Billie Eilish", style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 2.3 * SizeConfig.textMultiplier,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 24 * SizeConfig.widthMultiplier,
                        height: 12 * SizeConfig.heightMultiplier,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/eminem.jpg"))
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text("Eminem", style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 2.3 * SizeConfig.textMultiplier,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                  SizedBox(width: 20.0,),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 24 * SizeConfig.widthMultiplier,
                        height: 12 * SizeConfig.heightMultiplier,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/dualipa.jpg"))
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text("Dua Lipa", style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 2.3 * SizeConfig.textMultiplier,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                  SizedBox(width: 20.0,),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 24 * SizeConfig.widthMultiplier,
                        height: 12 * SizeConfig.heightMultiplier,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/brunomars.jpg"))
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text("Bruno Mars", style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 2.3 * SizeConfig.textMultiplier,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                  SizedBox(width: 20.0,),
                ],
              ),
            ),
          )
        ],
      ),


    );
  }
}