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
  String code = "";

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
                    onChanged: ((value) {
                      if (value.length == 1) {
                        code = code + value;
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
                    onChanged: ((value) {
                      if (value.length == 1) {
                        code = code + value;
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
                    onChanged: ((value) {
                      if (value.length == 1) {
                        code = code + value;
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
                    onChanged: ((value) {
                      if (value.length == 1) {
                        code = code + value;
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
                    onChanged: ((value) {
                      if (value.length == 1) {
                        code = code + value;
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
                    onChanged: ((value) {
                      if (value.length == 1) {
                        code = code + value;
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
                    if (code == '123456') //api code and 5 minutes
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                    }
                  },
                ),
              )
            ],
          ))
    ]);
  }
}
