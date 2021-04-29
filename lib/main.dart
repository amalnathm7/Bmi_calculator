import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';

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

enum Gender { Male, Female }

class BMIState extends State<BMI> {
  double height;
  double weight;
  double bmi;
  Gender _gender = Gender.Male;
  String str = "";

  final txt1 = TextEditingController();
  final txt2 = TextEditingController();

  void calc() {
    try {
      height = double.parse(txt1.text);
      weight = double.parse(txt2.text);

      bmi = (weight / height / height) * 10000;

      if (_gender == Gender.Male) {
        if (bmi < 18.5)
          str = "assets/men_under.jpg";
        else if (bmi <= 24.9)
          str = "assets/men_normal.jpg";
        else if (bmi <= 30)
          str = "assets/men_over.jpg";
        else if (bmi <= 34.9)
          str = "assets/men_obese.jpg";
        else
          str = "assets/men_extreme.jpg";
      } else {
        if (bmi < 18.5)
          str = "assets/women_under.jpg";
        else if (bmi <= 24.9)
          str = "assets/women_normal.jpg";
        else if (bmi <= 30)
          str = "assets/women_over.jpg";
        else if (bmi <= 34.9)
          str = "assets/women_obese.jpg";
        else
          str = "assets/women_extreme.jpg";
      }

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Your BMI = " + bmi.toStringAsPrecision(5),
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              content: Container(
                height: 200,
                child: Image.asset(str),
              ),
            );
          });
      txt1.clear();
      txt2.clear();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          backgroundColor: Colors.orange[700],
          title: Text(
            "BMI Calculator",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Let's see if you're ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.deepOrangeAccent),
                ),
                Text(
                  "healthy!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.lightGreen),
                ),
                Container(
                  height: 100,
                  child: Lottie.asset("assets/meter.json"),
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: txt1,
                  cursorColor: Colors.deepOrange,
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
                  cursorColor: Colors.deepOrange,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Enter your weight (in kg)",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text("Male"),
                        leading: Radio<Gender>(
                          activeColor: Colors.orange,
                          value: Gender.Male,
                          groupValue: _gender,
                          onChanged: (Gender value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text("Female"),
                        leading: Radio<Gender>(
                          activeColor: Colors.orange,
                          value: Gender.Female,
                          groupValue: _gender,
                          onChanged: (Gender value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: calc,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange),
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                          left: 3,
                          right: 3,
                        ))),
                    child: TextButton.icon(
                      label: Text(
                        "Calculate BMI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      icon: Icon(
                        Icons.speed,
                        color: Colors.black45,
                      ),
                    )),
              ],
            ),
          ),
        ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Copyright @ Amal Nath. All Rights Reserved.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
