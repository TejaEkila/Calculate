// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
//main.dart
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:myapp/buttons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userQuestions = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    '^',
    'ANS',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestions,
                        style: TextStyle(fontSize: 30,
                        color: const Color.fromARGB(255, 140, 80, 244)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(fontSize: 50,
                        color: Color.fromARGB(255, 71, 37, 79)),
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestions = '';
                            userAnswer = '';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.green,
                        textcolor: Color.fromARGB(255, 255, 217, 0),
                      );
                    } else if (index == 1) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            try {
                              userQuestions = userQuestions.substring(
                                  0, userQuestions.length - 1);
                            } catch (e) {
                              // Display the error message as a SnackBar
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('you have nothing to delete: $e'),
                                ),
                              );
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: Color.fromARGB(255, 171, 57, 49),
                        textcolor: Color.fromARGB(255, 255, 217, 0),
                      );
                    } else if (index == buttons.length - 1) {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            equalpressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Color.fromARGB(255, 165, 204, 246),
                        textcolor: Color.fromARGB(255, 255, 217, 0),
                      );
                    } else {
                      return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestions += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Color.fromARGB(255, 62, 13, 13)
                            : Color.fromARGB(255, 0, 0, 0),
                        textcolor: Color.fromARGB(255, 255, 217, 0),
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
  

  bool isOperator(String x) {
    if (x == '%' ||
        x == '/' ||
        x == 'x' ||
        x == '+' ||
        x == '-' ||
        x == '=' ||
        x == '^') {
      return true;
    }
    return false;
  }

  void equalpressed() {
    String finalQuestions = userQuestions;
    finalQuestions = userQuestions.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestions);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
