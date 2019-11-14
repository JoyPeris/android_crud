import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:android_crud/retrieveData.dart';
import 'package:sweetalert/sweetalert.dart';

class postDataScreen extends StatefulWidget{
  static String tag='postData';

  @override
  State<StatefulWidget> createState() => new _postDataScreenState();
}

class _postDataScreenState  extends State<postDataScreen>{
  final nameController=TextEditingController();
  final sirnameController=TextEditingController();
  final addressController=TextEditingController();
  final phonenumberController=TextEditingController();
  final statusController=TextEditingController();
  final nationalidController=TextEditingController();
  final ageController=TextEditingController();
  // Boolean variable for CircularProgressIndicator.
  bool visible = false ;

  Future webCall() async{


    // Getting value from Controller
    String firstname = nameController.text;
    String sirname =sirnameController.text;
    String address = addressController.text;
    String phonenumber = phonenumberController.text;
    String status = statusController.text;
    String nationalid = nationalidController.text;
    String age = ageController.text;



    // API URL
    var url = 'http://192.168.42.166:80/AndroidCrud/post.php';

    // Store all data with Param Name.
    var data = {'firstname': firstname,
                'sirname':sirname,
                 'address':address,
                'phonenumber':phonenumber,
                'status':status,
                'nationalid':nationalid,
               'age':age

    };

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);




  }

  bool _isHidden = true;

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 0.0),
        child: ListView(

          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'post data',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico"
              ),
            ),
            SizedBox(height: 20.0,),
           firstName(),
            SizedBox(height: 10.0,),
            sirName(),
            SizedBox(height: 10.0,),
            address(),
            SizedBox(height: 10.0,),
            phoneNumber(),
            SizedBox(height: 10.0,),
            status(),
            SizedBox(height: 10.0,),
            nationalID(),
            SizedBox(height: 10.0,),
            age(),

            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildButtonContainer(),
                buildViewButtonContainer(),
              ],
            ),

            SizedBox(height: 10.0,),

          ],
        ),
      ),
    );
  }

  Widget firstName(){
    return TextField(
      controller: nameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'First Name',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon:  Icon(Icons.person,
        color: Colors.deepOrange,),

      ),

    );
  }
  Widget sirName(){
    return TextField(
      controller: sirnameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Sir Name',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon:  Icon(Icons.person,
          color: Colors.deepOrange,),

      ),

    );
  }
  Widget address(){
    return TextField(
      controller: addressController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email Address',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon:  Icon(Icons.location_on,
          color: Colors.deepOrange,),

      ),

    );
  }
  Widget phoneNumber(){
    return TextField(
      controller: phonenumberController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Phone Number',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon:  Icon(Icons.phone,
          color: Colors.deepOrange,),

      ),

    );
  }
  Widget status(){
    return TextField(
      controller: statusController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Status',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon:  Icon(Icons.people,
          color: Colors.deepOrange,),

      ),

    );
  }
  Widget nationalID(){
    return TextField(
      controller: nationalidController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'National ID',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon:  Icon(Icons.featured_video,
          color: Colors.deepOrange,),

      ),

    );
  }
  Widget age(){
    return TextField(
      controller: ageController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Age',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon:  Icon(Icons.data_usage,
          color: Colors.deepOrange,),

      ),

    );
  }

  Widget buildButtonContainer(){
    return Container(
      height: 50.0,
      width:150,
     // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.0),
        gradient: LinearGradient(
            colors: [
              Color(0xFFFB415B),
              Color(0xFFEE5623)
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
        ),
      ),
      child: Center(
        child: FlatButton(onPressed:() {
          webCall();
          nameController.clear();
          sirnameController.clear();
          addressController.clear();
          phonenumberController.clear();
          statusController.clear();
          nationalidController.clear();
          ageController.clear();
          SweetAlert.show(context,
              title: "Successful",
              style: SweetAlertStyle.success);
          },

            child:       Text(
              "SEND DATA",
           style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
         ),     ),

      ),
    ));
  }
  Widget buildViewButtonContainer(){
    return Container(
        height: 50.0,
        width:150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          gradient: LinearGradient(
              colors: [
                Color(0xFFFB415B),
                Color(0xFFEE5623)
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft
          ),
        ),
        child: Center(
          child: FlatButton(onPressed: (){
            Navigator.of(context).pushNamed(retrieveDataScreen.tag);
          },
            child:       Text(
              "VIEW DATA",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),     ),
          ),
        ));
  }
}
