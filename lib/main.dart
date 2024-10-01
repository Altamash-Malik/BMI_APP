import 'package:bmi_application/FirstScreen.dart';
import 'package:bmi_application/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,title});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bgcolor= Colors.purple.shade100;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("MY HOME PAGE"),
      ),
      body: Container(
                    color: bgcolor,
        child: Center(
          child: Container(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI CALCULATOR",style: TextStyle(fontSize:50),),
                    Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> FirstScreen()));
              }, child: Text("BMI CHART"),
              ),
            ),
                SizedBox(height: 11,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter Your weight in KGs"),
                  ),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter Your Height in Feets"),
                  ),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text("Enter Your Height in inchs"),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();
        
                  if(wt!="" && ft!="")
                  {
                        var iWeight = int.parse(wt);
                        var iHeight = int.parse(ft);
                        var iInch = int.parse(inch);
        
                        var fttoinch = (iHeight*12) + iInch;
                        var inchToCm = fttoinch*2.54;
                        var CmtoM = inchToCm/100;
                        var bmi = iWeight/(CmtoM*CmtoM);
        
                        var msg ="";
        
                        
                        if(bmi>25)
                        {
                          msg="You are Over Weight";
                          bgcolor = Colors.red;
                        }
                        else if(bmi<18)
                        {
                          msg = "you are underweigth";
                          bgcolor = Colors.yellow;
                        }
                        else
                        {
                          msg = "You are healthy";
                          bgcolor = Colors.green;
                        }
                      
                        setState(() {
                                result = "Your BMI is ${bmi.toStringAsFixed(2)} \n $msg";    
                        });
        
                  }
                  else
                  {
                    setState(() {
                      result = "Please fill all the required Blanks!";
                    });
                  }
                  // Navigator.push(context, MaterialPageRoute(builder: ));
                }, child: Text("Result")),
        
                 Text(result),
                //  SizedBox(height: 30),
             
              ],
            ),
          ),
        ),
      )
    );
  }
}
