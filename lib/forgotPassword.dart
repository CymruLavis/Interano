import 'package:flutter/material.dart';
import 'package:test/login.dart';
import 'package:test/sign_up.dart';
import 'models/colourSwatch.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  static const String _title = 'Enter email';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colours().getAppBarColor(),
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final email = TextEditingController();
  String message = "";
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(children: <Widget>[
              Expanded(
                  child: TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  if (emailValidation(email.text) == false) {
                    setState(() {
                      message = "Invalid email";
                      isVisible = true;
                    });
                  } else {
                    setState(() {
                      isVisible = false;
                    });
                  }
                },
              ))
            ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  child: Text(
                    message,
                    style: TextStyle(
                        color: Colors.red, fontStyle: FontStyle.italic),
                  ),
                  visible: isVisible,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colours().getPrimarySwatch(),
                        minimumSize: Size(0, 40)),
                    child: const Text('Back'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colours().getPrimarySwatch(),
                        minimumSize: Size(0, 40)),
                    child: const Text('OK'),
                    onPressed: () {
                      if (email.text.isNotEmpty) {
                        //API to check if email exists in the database
                        // setState message = "this email does not exist in our system"
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      } else {
                        setState(() {
                          message = "Must enter an email";
                          isVisible = true;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
