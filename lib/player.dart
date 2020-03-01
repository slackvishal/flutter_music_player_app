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
              home: Player(),
            );
          },
        );
      },
    );
  }
}

class Player extends StatefulWidget {
  Player({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> with SingleTickerProviderStateMixin{

  double _value = 0.0;
  void _setValue(double value) {
    setState(() {
      _value = value;
    });
  }

  AnimationController animationController;
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
                Text("NOW PLAYING", style: TextStyle(
                  fontFamily: 'Nunito-Bold',
                  letterSpacing: 1.0,
                  fontSize: 2 * SizeConfig.textMultiplier,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),),
                Icon(Icons.more_vert, color: Colors.black,)
              ],
            ),
          ),

          SizedBox(height: 80.0,),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset("assets/billiebadguy.jpg", fit: BoxFit.cover,
            height: 40 * SizeConfig.heightMultiplier,
            width: 60 * SizeConfig.widthMultiplier,),
          ),
          SizedBox(height: 20.0,),
          Text("Bad Guy", style: TextStyle(
            fontFamily: 'Nunito-Bold',
            letterSpacing: 1.0,
            fontSize: 3 * SizeConfig.textMultiplier,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 15.0,),
          Text("Billie Eillish", style: TextStyle(
              fontFamily: 'Nunito-Bold',
              letterSpacing: 1.0,
              fontSize: 2 * SizeConfig.textMultiplier,
              color: Colors.black,
          ),),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            child: Slider(
              activeColor: Colors.orangeAccent,
              value: _value,
              inactiveColor: Colors.grey,
              onChanged: _setValue,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.fast_rewind, color: Colors.black,),
                CircleAvatar(
                  backgroundColor: Colors.black87,
                  radius: 40.0,
                  child: IconButton(
                    iconSize: 50,
                  color: Colors.white,
                  icon: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: animationController),
                    onPressed: (){
                      _handleOnPressed();
                    },
                  ),
                ),
                Icon(Icons.fast_forward, color: Colors.black,)
              ],
            ),
          )
        ],
      ),

    );
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
      ? animationController.forward()
          :animationController.reverse();
    });
  }
}
