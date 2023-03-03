import 'package:flutter/material.dart';
import 'package:untitled/theme.dart';


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
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          color: Colors.white12,
        )
      ),
        title: 'My App',
        home: Scaffold(
            appBar: AppBar(
              title: Image.asset("assets/logo.png")  ,
              elevation: 0.0,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      strnum.isEmpty ? '0' : strnum,
                      style: const TextStyle(fontSize: 90.0,
                      color: Color(0x0FFe4d5b7)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                    width: double.infinity,
                    color: Colors.black,
                    alignment: Alignment.center,
                    child: Table(
                      //ad. do dodania puste table row zeby odstepy byly i ogarniecie tych sizedboxow i stylowania i innych rzeczy, ktore nie dzialaja
                        children: [
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: buildElevatedButton('AC'),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(onPressed: tggl_sign, child: Text('+/-'), style: AppStyles.operationButtonStyle, ),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(onPressed: () => set_oper('%'), child: Text('%'), style: AppStyles.operationButtonStyle,),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(onPressed: () => set_oper('/'), child: Text('÷'), style: AppStyles.operationButtonStyle,),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(onPressed: () => func(7), child: Text('7'), style: AppStyles.operationButtonStyle,),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(onPressed: () => func(8), child: Text('8'), style: AppStyles.operationButtonStyle,),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(onPressed: () => func(9), child: Text('9'), style: AppStyles.operationButtonStyle,),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(onPressed: () => set_oper('*'), child: Text('×'), style: AppStyles.operationButtonStyle,),
                ),
              ],
            ),
            TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(onPressed: () => func(4), child: Text('4'), style: AppStyles.operationButtonStyle,),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(onPressed: () => func(5), child: Text('5'), style: AppStyles.operationButtonStyle,),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(onPressed: () => func(6), child: Text('6'), style: AppStyles.operationButtonStyle,),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(onPressed: () => set_oper('-'), child: Text('-'), style: AppStyles.operationButtonStyle,),
                  ),
                ],
            ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(onPressed: () => func(1), child: Text('1'), style: AppStyles.operationButtonStyle,),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(onPressed: () => func(2), child: Text('2'), style: AppStyles.operationButtonStyle,),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(onPressed: () => func(3), child: Text('3'), style: AppStyles.operationButtonStyle,),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(onPressed: () => set_oper('+'), child: Text('+'), style: AppStyles.operationButtonStyle,),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(onPressed: () => func(0), child: Text('0'), style: AppStyles.operationButtonStyle,),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(onPressed: () => func_decimal(), child: Text('.'), style: AppStyles.operationButtonStyle,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(onPressed: () => set_oper('**'), child: Text('^'), style: AppStyles.operationButtonStyle,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(onPressed: calculate, child: Text('='), style: AppStyles.operationButtonStyle,),
                              ),
                            ],
                          ),
                        ],
                    ),
                ),
              ],
            ),
        ),
    );

  }

  ElevatedButton buildElevatedButton(String text) => ElevatedButton(onPressed:  reset, style: AppStyles.operationButtonStyle, child: Text(text),);

  void func(int n) {
    setState(() {
      strnum += n.toString();
    });
  }

  void func_decimal() {
    setState(() {
      if (!strnum.contains(".")) {
        strnum += ".";
      }
    });
  }

  void tggl_sign() {
    setState(() {
      if (strnum.startsWith("-")) {
        strnum = strnum.substring(1);
      } else {
        strnum = "-" + strnum;
      }
    });
  }

  void set_oper(String op) {
    setState(() {
      oper = op;
      num = double.parse(strnum);
      strnum = "";
    });
  }

  void calculate() {
    setState(() {
      double second_num = double.parse(strnum);
      if (oper == "+") {
        res = num + second_num;
      } else if (oper == "-") {
        res = num - second_num;
      } else if (oper == "*") {
        res = num * second_num;
      } else if (oper == "/") {
        res = num / second_num;
      } else if (oper == "%") {
        res = num % second_num;
      } else if (oper == "**") {
        res = num * second_num;
      }

      strnum = res.toString();
    });
  }

  void reset() {
    setState(() {
      num = 0;
      strnum = "";
      oper = "";
      res = 0;
    });
  }
}

