import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
//
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    late int firstnum;
    late int secondnumber;
    String text_to_display = "";
    late String operation_to_perform;
    late String result;

    void buttonClicked(String buttonValue){

      if(buttonValue == "C"){
        text_to_display = "";
        firstnum = 0;
        secondnumber = 0;
        result = "";
      }
      else if(buttonValue == "+" || buttonValue == "-" || buttonValue == "*" || buttonValue == "/"){
        firstnum = int.parse(text_to_display);

        result = "";

        operation_to_perform = buttonValue;
      }
      else if(buttonValue == "="){
        secondnumber = int.parse(text_to_display);

        if(operation_to_perform == "+") {
          result = (firstnum + secondnumber).toString();
        }
        if(operation_to_perform == "-") {
          result = (firstnum - secondnumber).toString();
        }
        if(operation_to_perform == "*") {
          result = (firstnum * secondnumber).toString();
        }
        if(operation_to_perform == "/") {
          result = (firstnum / secondnumber).toString();
        }
      }
      else {
        result = int.parse(text_to_display + buttonValue).toString();
      }

      setState(() {
        text_to_display = result;
      });
    }


  Widget customButtom(String buttonValue){
    return Expanded(child: OutlineButton(
      padding: EdgeInsets.all(25.0),
      onPressed: () => buttonClicked(buttonValue) ,
      child: Text(
        buttonValue,
        style: TextStyle(
            fontSize: 25.0
        ),
      ),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator by Alka'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$text_to_display",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
            ),
            Row(
              children: [
                customButtom("+"),
                customButtom("-"),
                customButtom("*"),
                customButtom("/"),
              ],
            ),
            Row(
              children: [
                customButtom("9"),
                customButtom("8"),
                customButtom("7"),
                customButtom("C"),
              ],
            ),
            Row(
              children: [
                customButtom("6"),
                customButtom("5"),
                customButtom("4"),
                customButtom("="),
              ],
            ),
            Row(
              children: [
                customButtom("3"),
                customButtom("2"),
                customButtom("1"),
                customButtom("0"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



