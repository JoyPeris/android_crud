import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class retrieveDataScreen extends StatefulWidget{
  static String tag='retrieveData';
  @override
  State<StatefulWidget> createState() => new _retrieveDataScreenState();
}

class _retrieveDataScreenState  extends State<retrieveDataScreen>{

  Future<List> fetchData() async{
    var url = 'http://192.168.42.166:80/AndroidCrud/get.php';
    final response = await http.get(url);
    return json.decode(response.body);
    //print(data.toString());
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('MY STORE',textAlign: TextAlign.center,),),
      body: FutureBuilder<List>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData ? new ItemList(list: snapshot.data,)
              : new Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

    );
  }}
  class ItemList extends StatelessWidget{
    List list;
    ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Text(list[i]['firstname']),

                    SizedBox(width: 5,),
                    Text(list[i]['sirname']),
                  ],
                ),

                leading: Icon(Icons.widgets),

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 2,),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.start,

                      children: <Widget>[
                        Text('Address : '),

                        Text(list[i]['address'])
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Phone Number : '),
                        Text(list[i]['phonenumber'])
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Status : '),
                        Text(list[i]['status'])
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('National ID : '),
                        Text(list[i]['address'])
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Age : '),
                        Text(list[i]['age'])
                      ],
                    ),

                  ],
                ),

              ),

            ),
          );
        })
    ;
  }}
