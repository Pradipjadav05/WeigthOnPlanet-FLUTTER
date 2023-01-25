import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _weigthControler = TextEditingController();
  int radioValue = 0;
  // ignore: unused_field
  double _finalResult = 0.0;
  String _formattedText = "";

  void handleRadioValueChanged(int value) {
    /*
      Source: https://www.livescience.com/33356-weight-on-planets-mars-moon.html
        Mercury: 0.38
        Venus: 0.91
        Earth: 1.00
        Mars: 0.38
        Jupiter: 2.34
        Saturn: 1.06
        Uranus: 0.92
        Neptune: 1.19
        Pluto: 0.06
     */
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weigthControler.text, 0.06);
          _formattedText =
              "Your weight on Plutto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weigthControler.text, 0.38);
          _formattedText =
              "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";

          break;
        case 2:
          _finalResult = calculateWeight(_weigthControler.text, 0.91);
          _formattedText =
              "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
      }
      // print(radioValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weigth On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.5),
          children: [
            Image.asset(
              "images/planet.png",
              height: 133.0,
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  TextField(
                    controller: _weigthControler,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Your Weigth On Earth",
                      hintText: "In Pounds",
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5.0)),
                  //Three Radio Button:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: (value) {
                            handleRadioValueChanged(0);
                          }),
                      const Text(
                        "Plutto",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: (value) {
                            handleRadioValueChanged(1);
                          }),
                      const Text(
                        "Mars",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: (value) {
                            handleRadioValueChanged(2);
                          }),
                      const Text(
                        "Venus",
                        style: TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.6),
                  ),

                  //Result Text:
                  Text(
                    _weigthControler.text.isEmpty
                        ? "Please enter weigth"
                        : "$_formattedText lbs",
                    style: const TextStyle(
                        fontSize: 19.4,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (weight.isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      // ignore: avoid_print
      print("Wrong");
      return int.parse("180") * 0.38;
    }
  }
}
