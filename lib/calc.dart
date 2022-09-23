import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String result = "0"; String rs = "0";
  double a = 0.0; double b = 0.0;
  String op = "";
  buttonPressed(String buttonText){
    if(buttonText == "C"){
      rs = "0";
      a = 0.0;
      b = 0.0;
      op = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){
      a = double.parse(result);
      op = buttonText;
      rs = "0";

    } else if(buttonText == "."){
      if(rs.contains(".")){
        print("Already conatains a decimals");
        return;

      } else {
        rs = rs + buttonText;
      }








      //OPERATORS
      // +
    } else if (buttonText == "="){
      b = double.parse(result);
      if(op == "+"){
        rs = (a + b).toString();
      }
      // -
      if(op == "-"){
        rs = (a - b).toString();
      }
      // x
      if(op == "X"){
        rs = (a * b).toString();
      }
      // /
      if(op == "/"){
        rs = (a / b).toString();
      }
      a = 0; b = 0; op = "";
    } else {
      rs = rs + buttonText;
    }
    print(rs);







//FRAME
    setState(() {
      result = double.parse(rs).toStringAsFixed(0);
    });
  }










  //BODY
  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlinedButton(
        child: new Text(buttonText,
          style: TextStyle(
              fontSize: 85.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () => buttonPressed(buttonText)
        ,
      ),
    );
  }










  //CONTAINER
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),), body:
    new Container(
        child: new Column(
          children: <Widget>[
            new Container(
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: new Text(result, style: new TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold,))),
            new Expanded(child: new Divider(),
            ),

















            //BABIES
            new Column(children: [
              new Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/")
              ]),

              new Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X")
              ]),

              new Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ]),

              new Row(children: [
                buildButton("C"),
                buildButton("0"),
                buildButton("."),
                buildButton("+")
              ]),

              new Row(children: [
                buildButton("OFF"),
                buildButton("="),
              ])
            ])
          ],
        )));
  }
}