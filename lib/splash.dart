import 'dart:async';

import 'package:bmi_application/main.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }
  @override
  Widget build(Object context) {

    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromARGB(255, 158, 130, 191),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Text("LOADING BMI CALCULATOR",style: TextStyle(fontSize: 50),)
            
            ],
          ),
        ),
      ),
    );
  }
}