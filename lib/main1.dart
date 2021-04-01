import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI Calculator",
      home: BMI(),
    );
  }
}

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BMIState();
  }
}

class BMIState extends State<BMI> {
  double height;
  double weight;
  String bmi = "";

  final txtHeight = TextEditingController();
  final txtWeight = TextEditingController();

  void calculate() {
    try {
      height = double.parse(txtHeight.text);
      weight = double.parse(txtWeight.text);

      setState(() {
        bmi = "Your BMI = " + ((weight / height / height) * 10000).toString();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              TextField(
                controller: txtHeight,
                cursorColor: Colors.orange,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter height (in cm)",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange))),
              ),
              TextField(
                controller: txtWeight,
                cursorColor: Colors.orange,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter weight (in kg)",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange))),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: calculate,
                child: Text(
                  "Calculate BMI",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(bmi),
              SizedBox(
                height: 50,
              ),
              Image.asset("assets/bmi.jpg")
            ],
          ),
        ),
      ),
    );
  }
}
