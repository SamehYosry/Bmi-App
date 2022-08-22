import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// ------------Start Weight AND Age Counter------------
  int weight = 0;
  int age = 0;
  void incrementValueFunction() {
    setState(
      () {},
    );
  }
  // ------------End Weight AND Age Counter------------

//***************************************************** */

//---------------Start Theme Mode data---------------
  bool isdarkTheme = false;
  // Function to toggel theme of Scaffold
  void toggelScaffoldTheme() {
    setState(() {
      isdarkTheme = !isdarkTheme;
    });
  }
  //---------------End Theme Mode data---------------

//--------------Start All Colors Of Widget-------
  Color allColor = Colors.blueGrey.shade600;
  Color allColor1 = Colors.brown.shade600;
  bool isMale = true;
  void setAllTextColors(Color c, bool s) {
    setState(() {
      isMale = s;
      isMale ? allColor : allColor1;
    });
  }

//--------------End All Colors Of Widget-------

//***************************************** */

//-----------------Start Slider Data------------------------
  double sliderValue = 0;
//-----------------End Slider Data------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (isdarkTheme == false) ? Colors.white : Colors.grey[850],
      appBar: AppBar(
        title: const Text(
          'BMI APP',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: toggelScaffoldTheme,
            icon: isdarkTheme
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          ),
        ],
        backgroundColor: isMale ? allColor : allColor1,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setAllTextColors(Colors.blueGrey.shade600, true);
                  },
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isMale ? allColor : Colors.pink.shade200,
                    ),
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.male,
                            size: 70,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Male",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Female
                InkWell(
                  onTap: () {
                    setAllTextColors(allColor1, false);
                  },
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: isMale ? Colors.pink.shade200 : allColor1),
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.female,
                            size: 70,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Female",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.pink.shade200),
                    padding: const EdgeInsets.all(20),
                    height: 180,
                    child: Column(
                      children: [
                        const Text(
                          'HEIGHT',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              child: Text(
                                '${sliderValue.round()}',
                                style: const TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Text(
                              'Cm',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        // Slider To Control The Text Size
                        Slider(
                            value: sliderValue,
                            min: 0,
                            max: 300,
                            activeColor: Colors.black,
                            inactiveColor: Colors.white,
                            thumbColor: isMale ? allColor : allColor1,
                            onChanged: (value) {
                              setState(() {
                                sliderValue = value;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.pink.shade200),
                  padding: const EdgeInsets.all(10),
                  width: 150,
                  height: 150,
                  child: Column(
                    children: [
                      const Text(
                        'WEIGHT',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$weight',
                            style: const TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Kg',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  isMale ? allColor : allColor1),
                              shape: MaterialStateProperty.all(
                                const CircleBorder(),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: const Text(
                              "+",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  isMale ? allColor : allColor1),
                              shape: MaterialStateProperty.all(
                                const CircleBorder(),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: const Text(
                              "-",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.pink.shade200),
                  padding: const EdgeInsets.all(10),
                  width: 150,
                  height: 150,
                  child: Column(
                    children: [
                      const Text(
                        'AGE',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$age',
                        style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  isMale ? allColor : allColor1),
                              shape: MaterialStateProperty.all(
                                const CircleBorder(),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: const Text(
                              "+",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  isMale ? allColor : allColor1),
                              shape: MaterialStateProperty.all(
                                const CircleBorder(),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: const Text(
                              "-",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  color: isMale ? allColor : allColor1),
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.only(top: 25, bottom: 25)),
                ),
                onPressed: () {
                  double result = weight / pow(sliderValue / 100, 2);
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return sliderValue > 0
                          ? AlertDialog(
                              backgroundColor: isMale ? allColor : allColor1,
                              title: const Text(
                                'Your Bmi Result',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'BMI :${result.round()}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Grander :${(isMale) ? ('Male') : ('Female')}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Your Height : ${sliderValue.round()} Cm',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Your Weight : $weight Kg',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Your Age : $age Years',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ]),
                              actions: [
                                ElevatedButton(
                                  onPressed: (() {
                                    Navigator.pop(context);
                                  }),
                                  child: const Text('ok'),
                                ),
                              ],
                              actionsAlignment: MainAxisAlignment.center,
                            )
                          : AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text("Please Enter Height"),
                              actions: [
                                ElevatedButton(
                                  onPressed: (() {
                                    Navigator.pop(context);
                                  }),
                                  child: const Text('ok'),
                                ),
                              ],
                            );
                    },
                  );
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
