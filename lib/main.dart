import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double num = 0;
  String strnum = "";
  String oper = "";
  double res = 0;


  @override
  Widget build(BuildContext context) {
    String text1 = "Hello World 222";
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text('My App',
          style:TextStyle(
            fontFamily: 'Arial',
            fontSize: 17.0,
            color: Colors.yellowAccent) ,),
        ),
        body:
        Container(
          width: double.infinity,
          color: Colors.amber,
          alignment: Alignment.center,
          child: Table(
            children: [
              TableRow(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('')),
                  ElevatedButton(onPressed: () {}, child: Text('$num')),
                  ElevatedButton(onPressed: () {}, child: Text('wynik:')),
                  ElevatedButton(onPressed: () {}, child: Text(strnum)), //res
                ],
              ),
              TableRow(
                children: [
                  ElevatedButton(onPressed: reset, child: Text('ac')),
                  ElevatedButton(onPressed: tggl_sign, child: Text('+/-')),
                  ElevatedButton(onPressed: () => set_oper('%'), child: Text('%')),
                  ElevatedButton(onPressed: () => set_oper('/'), child: Text('/')),
                ],
              ),
              TableRow(
                children: [
                  ElevatedButton(onPressed: () => func(7), child: Text('7')),
                  ElevatedButton(onPressed: () => func(8), child: Text('8')),
                  ElevatedButton(onPressed: () => func(9), child: Text('9')),
                  ElevatedButton(onPressed: () => set_oper('*'), child: Text('*')),
                ],
              ),
              TableRow(
                children: [
                  ElevatedButton(onPressed: () => func(4), child: Text('4')),
                  ElevatedButton(onPressed: () => func(5), child: Text('5')),
                  ElevatedButton(onPressed: () => func(6), child: Text('6')),
                  ElevatedButton(onPressed: () => set_oper('-'), child: Text('-')),
                ],
              ),
              TableRow(
                children: [
                  ElevatedButton(onPressed: () => func(1), child: Text('1')),
                  ElevatedButton(onPressed: () => func(2), child: Text('2')),
                  ElevatedButton(onPressed: () => func(3), child: Text('3')),
                  ElevatedButton(onPressed: () => set_oper('+'), child: Text('+')),
                ],
              ),
              TableRow(
                children: [
                  ElevatedButton(onPressed: () => func(0), child: Text('0')),
                  ElevatedButton(onPressed: () {}, child: Text('0')),
                  ElevatedButton(onPressed: comma , child: Text(',')),
                  ElevatedButton(onPressed: show_res, child: Text('=')),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }

  void func(int input){
    setState(() {
      strnum += input.toString();
    });
  }

  void set_oper(String op){
    setState(() {
      oper = op;
      num = double.parse(strnum);
      strnum = "";
    });
  }

  void comma(){
    if(!strnum.contains('.')){
      setState(() {
        strnum += ".";
      });
    }
  }

  void reset(){
    setState(() {
      strnum ="";
      num = 0;
      res = 0;
      oper = "";
    });
  }

  void tggl_sign(){
    setState(() {
      if (strnum.startsWith("-")){
        strnum = strnum.substring(1);
      }
      else  {
        strnum = "-" + strnum;
      }
    });
  }

  void show_res() {
    setState(() {
      double newNum = double.parse(strnum);
      switch(oper){
        case "+":
          res = num + newNum;
          break;
        case "-":
          res = num - newNum;
          break;
        case"*":
          res = num * newNum;
          break;
        case"/":
          res = num / newNum;
          break;
        case"%":
          res = (num*0.01) * newNum;
          break;
      }
      strnum = res.toString();
      oper = "";
    });
  }
}




//class TextWidget extends StatelessWidget {
  //const TextWidget({
    //super.key,
    //required this.text1,
    //required this.numebrr,
  //});

  //final String text1;
  //final int numebrr;

  //@override
  //Widget build(BuildContext context) {
    //return GestureDetector(
      //onTap: (){print(text1);},
      //child: Text(
        //'$numebrr',
        //style:const TextStyle(fontSize: 24),
      //),
    //);
  //}
//}
