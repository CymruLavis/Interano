import 'package:flutter/material.dart';
import 'package:test/login.dart';
import 'package:test/settings.dart';
import 'package:test/sign_up.dart';
import 'models/colourSwatch.dart';

class ChangePhoneNumber extends StatelessWidget {
  const ChangePhoneNumber({Key? key}) : super(key: key);
  static const String _title = 'Chnage Phone Number';

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
  final phoneNum = TextEditingController();
  int flex1 = 3;
  int flex2 = 6;
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
                flex: flex1,
                child: const Text('Phone Number'),
              ),
              Expanded(
                  flex: flex2,
                  child: TextField(
                    controller: phoneNum,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                    ),
                    onChanged: (value) {
                      if (double.tryParse(phoneNum.text) == null) {
                        setState(() {
                          message = "Invalid phone number";
                          isVisible = true;
                        });
                      } else {
                        if (phoneNumberValidation(phoneNum.text) == false) {
                          setState(() {
                            message = "Invalid phone number length";
                            isVisible = true;
                          });
                        } else {
                          setState(() {
                            isVisible = false;
                          });
                        }
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
                            builder: (context) => const Settings()),
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
                      child: const Text('Save'),
                      onPressed: () {
                        // changeEmailAPI(gender);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Settings()),
                        );
                      }),
                ),
              ],
            ),
          ),
        ]));
  }
}

void changeEmailAPI(String email) {}
