import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/map_page.dart';
import 'models/colourSwatch.dart';
import 'package:test/login.dart';

class AccountValidation extends StatelessWidget {
  const AccountValidation({Key? key}) : super(key: key);
  static const String pageName = 'Verification Code';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: pageName,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(pageName),
          backgroundColor: Colours().getAppBarColor(),
        ),
        body: const ValidationWidget(),
      ),
    );
  }
}

class ValidationWidget extends StatefulWidget {
  const ValidationWidget({Key? key}) : super(key: key);

  @override
  State<ValidationWidget> createState() => ValidationWidgets();
}

class ValidationWidgets extends State<ValidationWidget> {
  TextEditingController validationInput = TextEditingController();
  String validationText = "";
  final primaryColour = Colours();
  final num1 = TextEditingController();
  final num2 = TextEditingController();
  final num3 = TextEditingController();
  final num4 = TextEditingController();
  final num5 = TextEditingController();
  final num6 = TextEditingController();
  String code = "";
  String valCode = "";
  String message = "";
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: Text("Verification code has been sent to "),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: Text("redacted phone number"),
      ),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                child: SizedBox(
                  height: 50,
                  width: 46,
                  child: TextFormField(
                    controller: num1,
                    onChanged: ((value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                child: SizedBox(
                  height: 50,
                  width: 46,
                  child: TextFormField(
                    controller: num2,
                    onChanged: ((value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                child: SizedBox(
                  height: 50,
                  width: 46,
                  child: TextFormField(
                    controller: num3,
                    onChanged: ((value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                child: SizedBox(
                  height: 50,
                  width: 46,
                  child: TextFormField(
                    controller: num4,
                    onChanged: ((value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                child: SizedBox(
                  height: 50,
                  width: 46,
                  child: TextFormField(
                    controller: num5,
                    onChanged: ((value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                child: SizedBox(
                  height: 50,
                  width: 46,
                  child: TextFormField(
                    controller: num6,
                    onChanged: ((value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
              ),
            ],
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Code will expire in 5 minutes")])),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              child: Text(
                message,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
              ),
              visible: isVisible,
            )
          ],
        ),
      ),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColour.getPrimarySwatch(),
                      minimumSize: Size(0, 40)),
                  child: const Text('Resend Code'),
                  onPressed: () {
                    //api to resend code and reset time sent
                    //valCode = api for new code
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColour.getPrimarySwatch(),
                      minimumSize: Size(0, 40)),
                  child: const Text('Ok'),
                  onPressed: () {
                    code = num1.text +
                        num2.text +
                        num3.text +
                        num4.text +
                        num5.text +
                        num6.text;
                    if (code == valCode) //api code and 5 minutes
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                    } else {
                      setState(() {
                        message = "Incorrect code";
                        isVisible = true;
                      });
                    }
                  },
                ),
              )
            ],
          ))
    ]);
  }
}
