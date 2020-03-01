import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Podcasts(),
    );
  }
}

class Podcasts extends StatefulWidget {
  Podcasts({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _PodcastsState createState() => _PodcastsState();
}

class _PodcastsState extends State<Podcasts> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}