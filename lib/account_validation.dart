import 'package:flutter/material.dart';
import 'models/colourSwatch.dart';
import 'package:test/login.dart';

class AccountValidation extends StatelessWidget {
  const AccountValidation({Key? key}) : super(key: key);
  static const String pageName = 'Account Validation';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                'Enter the code that was sent to your email and press ok.',
                style: TextStyle(
                    color: primaryColour.getPrimarySwatch(),
                    //It would be great to get this color working with the function
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              )),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: validationInput,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '',
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColour.getPrimarySwatch()),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ),
        ]));
  }
}
