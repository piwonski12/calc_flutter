import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';



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

  GlobalKey _appBarKey = GlobalKey();
// alert o kopiowaniu tekstu nie działą
  void onTextCopied(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // set up the button
        Widget okButton = TextButton(
          child: Text("OK"),
          onPressed: () { Navigator.pop(context); },
        );

        // set up the AlertDialog
        AlertDialog alert = AlertDialog(
          title: Text("Skopiowano!"),
          content: Text("Tekst został skopiowany do schowka."),
          actions: [
            okButton,
          ],
        );

        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
        )
      ),
        title: 'My App',
        home: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.all(16.0),
                    child:
                        GestureDetector(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(text: strnum));
                            onTextCopied();
                          },
                          child: Text(
                      strnum.isEmpty ? '0' : strnum,
                      style: const TextStyle(fontSize: 110.0,
                      color: Colors.white,
                      ),
                    ),
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
                  child: buildElevatedButton( reset , 'AC', AppStyles.top_bttn),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: buildElevatedButton(tggl_sign, "+/-", AppStyles.top_bttn),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                    child: buildElevatedButton(()=> set_oper('%'), "%", AppStyles.top_bttn),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                    child: buildElevatedButton(()=> set_oper('/'), "÷", AppStyles.right_bttn),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: buildElevatedButton(()=> func(7), "7", style_bttn),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: buildElevatedButton(()=> func(8), "8", style_bttn),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: buildElevatedButton(()=> func(9), "9", style_bttn),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: buildElevatedButton(()=> set_oper('*'), "×", AppStyles.right_bttn),
                ),
              ],
            ),
            TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: buildElevatedButton(() => func(4), "4", style_bttn),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: buildElevatedButton(() => func(5), "5", style_bttn),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: buildElevatedButton(() => func(6), "6", style_bttn),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: buildElevatedButton(() => set_oper('-'), "-", AppStyles.right_bttn),
                  ),
                ],
            ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: buildElevatedButton(() => func(1), "1", style_bttn),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: buildElevatedButton(() => func(2), "2", style_bttn),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: buildElevatedButton(() => func(3), "3", style_bttn),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: buildElevatedButton(() => set_oper('+'), "+", AppStyles.right_bttn),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: buildElevatedButton(() => func(0), "0", style_bttn),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: buildElevatedButton(() => func_decimal(), ".", style_bttn),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                  child: buildElevatedButton(()=> set_oper('**'), '^', style_bttn)
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: buildElevatedButton( calculate , '=', AppStyles.right_bttn),
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

  final ButtonStyle style_bttn = AppStyles.operationButtonStyle;

  Widget buildElevatedButton(GestureTapCallback onPressed, String buttonText, ButtonStyle buttonStyle) {
    return ElevatedButton(
      onPressed: onPressed,
      //child: Text(buttonText),
      child: AutoSizeText(buttonText,
      style: TextStyle(fontSize: 40),
      maxLines: 1,),
      style: buttonStyle,
    );
  }



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

