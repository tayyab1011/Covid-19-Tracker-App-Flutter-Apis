
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project/login.dart';
import 'package:flutter_project/payment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hello extends StatefulWidget {


  @override
  State<Hello> createState() => HelloState();
}

class HelloState extends State<Hello> {
  static const String KEYLOGIN= "login";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shared pref"),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
          child: Text("Hello"),
        ),
      )
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 2), () {
      if(isLoggedIn != null){
        if(isLoggedIn){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>FormScreen()));
        }
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>FormScreen()));
      }

    });

  }


}
