import 'package:calculator/Constant.dart';
import 'package:calculator/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = "";
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    userInput.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 0.1,
                    indent: 80,
                    endIndent: 80,
                  ),
                  Text(
                    answer.toString(),
                    style: TextStyle(
                        fontSize: 70,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(children: [
                  MyButton(
                    title: "AC",
                    color: Colors.pinkAccent.shade400,
                    onPress: () {
                      userInput = '';
                      answer = '';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: "+/-",
                    color: Colors.pinkAccent.shade400,
                    onPress: () {
                      userInput += '';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: "%",
                    color: Colors.pinkAccent.shade400,
                    onPress: () {
                      userInput += '%';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: "/",
                    color: Colors.pinkAccent.shade400,
                    onPress: () {
                      userInput += '/';
                      setState(() {});
                    },
                  ),
                ]),
                Row(children: [
                  MyButton(
                    title: "7",
                    onPress: () {
                      userInput += '7';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: "8",
                    onPress: () {
                      userInput += '8';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: "9",
                    onPress: () {
                      userInput += '9';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: "X",
                    color: Colors.pinkAccent.shade400,
                    onPress: () {
                      userInput += 'x';
                      setState(() {});
                    },
                  ),
                ]),
                Row(children: [
                  MyButton(
                    title: "4",
                    onPress: () {
                      userInput += '4';
                      setState(() {});
                      ;
                    },
                  ),
                  MyButton(
                    title: "5",
                    onPress: () {
                      userInput += '5';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: "6",
                    onPress: () {
                      userInput += '6';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: "-",
                    color: Colors.pinkAccent.shade400,
                    onPress: () {
                      userInput += '-';
                      setState(() {});
                    },
                  ),
                ]),
                Row(children: [
                  MyButton(
                    title: "1",
                    onPress: () {
                      userInput += '1';
                      setState(() {});
                      ;
                    },
                  ),
                  MyButton(
                    title: "2",
                    onPress: () {
                      userInput += '2';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: "3",
                    onPress: () {
                      userInput += '3';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: "+",
                    color: Colors.pinkAccent.shade400,
                    onPress: () {
                      userInput += '+';
                      setState(() {});
                    },
                  ),
                ]),
                Row(children: [
                  MyButton(
                    title: "0",
                    onPress: () {
                      userInput += '0';
                      setState(() {});
                      ;
                    },
                  ),
                  MyButton(
                    title: ".",
                    onPress: () {
                      userInput += '.';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: "DEL",
                    onPress: () {
                      userInput = userInput.substring(0, userInput.length - 1);
                      setState(() {});
                    },
                  ),
                  MyButton(
                      title: "=",
                      color: Colors.pinkAccent.shade400,
                      onPress: () {
                        equalPress();
                        setState(() {});
                      }),
                ]),
              ],
            ),
          ),
        ]),
      )),
    );
  }

  void equalPress() {
    String finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
