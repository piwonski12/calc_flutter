import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/theme.dart';
import 'dart:math';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double num = 0;
  String strnum = "";
  String oper = "";
  double res = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            color: Colors.black,
          )),
      title: 'My App',
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black,
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(0.5),
                child: GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                        text: strnum.replaceAll(RegExp(r"([.]*[0]*)$"), "")));
                    onTextCopied();
                  },
                  child: RichText(
                    text: TextSpan(
                      text: strnum.isEmpty
                          ? '0'
                          : strnum.replaceAll(RegExp(r"([.]*[0]*)$"), ""),
                      style: const TextStyle(
                        fontSize: 110.0,
                        color: Colors.white,
                      ),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              color: Colors.black,
              alignment: Alignment.center,
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: buildElevatedButton(
                            reset, 'AC', AppStyles.top_bttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: buildElevatedButton(
                            tgglSign, "+/-", AppStyles.top_bttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: buildElevatedButton(
                            () => setOper('%'), "%", AppStyles.top_bttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: buildElevatedButton(
                            () => setOper('/'), "÷", AppStyles.right_bttn),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            buildElevatedButton(() => func(7), "7", styleBttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            buildElevatedButton(() => func(8), "8", styleBttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            buildElevatedButton(() => func(9), "9", styleBttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: buildElevatedButton(
                            () => setOper('*'), "×", AppStyles.right_bttn),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            buildElevatedButton(() => func(4), "4", styleBttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            buildElevatedButton(() => func(5), "5", styleBttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            buildElevatedButton(() => func(6), "6", styleBttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: buildElevatedButton(
                            () => setOper('-'), "-", AppStyles.right_bttn),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            buildElevatedButton(() => func(1), "1", styleBttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            buildElevatedButton(() => func(2), "2", styleBttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            buildElevatedButton(() => func(3), "3", styleBttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: buildElevatedButton(
                            () => setOper('+'), "+", AppStyles.right_bttn),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            buildElevatedButton(() => func(0), "0", styleBttn),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: buildElevatedButton(
                            () => funcDecimal(), ".", styleBttn),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: buildElevatedButton(
                              () => setOper('**'), '^', styleBttn)),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: buildElevatedButton(
                            calculate, '=', AppStyles.right_bttn),
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

  final ButtonStyle styleBttn = AppStyles.operationButtonStyle;

  Widget buildElevatedButton(GestureTapCallback onPressed, String buttonText,
      ButtonStyle buttonStyle) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(buttonText),
    );
  }

  void func(int n) {
    setState(() {
      strnum += n.toString();
    });
  }

  void funcDecimal() {
    setState(() {
      if (!strnum.contains(".")) {
        strnum += ".";
      }
    });
  }

  void tgglSign() {
    setState(() {
      if (strnum.startsWith("-")) {
        strnum = strnum.substring(1);
      } else {
        strnum = "-$strnum";
      }
    });
  }

  void setOper(String op) {
    setState(() {
      oper = op;
      num = double.parse(strnum);
      strnum = "";
    });
  }

  void calculate() {
    setState(() {
      double secondNum = double.parse(strnum);
      if (oper == "+") {
        res = num + secondNum;
      } else if (oper == "-") {
        res = num - secondNum;
      } else if (oper == "*") {
        res = num * secondNum;
      } else if (oper == "/") {
        res = num / secondNum;
      } else if (oper == "%") {
        res = num % secondNum;
      } else if (oper == "**") {
        res = res = pow(num, secondNum).toDouble();
      }
      if (res.isFinite) {
        setState(() {
          strnum = res.toStringAsFixed(3);
          num = res;
          oper = "";
        });
      } else {
        setState(() {
          reset();
        });
        ElegantNotification.error(
                title: const Text("Error"),
                description: const Text("Result unavailable."))
            .show(context);
      }
    });
  }

  void onTextCopied() {
    ElegantNotification.success(
            title: const Text("Success"),
            description: const Text("Result has been copied to the clipboard."))
        .show(context);
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
