import "package:flutter/material.dart";

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
  double bmi;
  String str = "";

  final txt1 = TextEditingController();
  final txt2 = TextEditingController();

  void calc() {
    try {
      height = double.parse(txt1.text);
      weight = double.parse(txt2.text);

      bmi = (weight / height / height) * 10000;

      setState(() {
        str = "Your BMI = " + bmi.toString();
      });
    } catch (e) {
      setState(() {
        str = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: txt1,
                  cursorColor: Colors.orange,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter your height (in cm)",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: txt2,
                  cursorColor: Colors.orange,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter your weight (in kg)",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))),
                ),
                SizedBox(
                  height: 50,
                ),
                TextButton(
                    onPressed: calc,
                    child: Text(
                      "Calculate BMI",
                      style: TextStyle(color: Colors.orange, fontSize: 20),
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(str),
                SizedBox(
                  height: 20,
                ),
                Image.asset("assets/bmi.jpg"),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}