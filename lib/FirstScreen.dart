import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FirstScreen extends StatefulWidget{
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
       backgroundColor: Theme.of(context).colorScheme.inversePrimary ,
       title: Text("FirstPage"),
    ),
    body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Container(
        color: Colors.purple.shade100,
        child: Center(
          child: Column(
            children: [
              Text("BMI CHART FOR ADULTS"),
              Image.asset('assets/bmichart.jpg'),
          
            ],
          ),
        ),
      ),  
    ),
    );
  }
}