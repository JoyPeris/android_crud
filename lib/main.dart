import 'package:flutter/material.dart';
import 'package:android_crud/postData.dart';
import 'package:android_crud/retrieveData.dart';

void main()=>
    runApp(androidApp());

class androidApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _androidAppState();

}

class _androidAppState extends State<androidApp>{
  final routes=<String, WidgetBuilder>{
    postDataScreen.tag:(context)=>postDataScreen(),
    retrieveDataScreen.tag:(context)=>retrieveDataScreen()
  };
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      title: "Waste App",
      home: postDataScreen(),
      routes: routes,
    );
  }

}