import 'dart:html';

import 'package:flutter/material.dart';
import 'package:test/changeEmail.dart';
import 'package:test/changeGender.dart';
import 'package:test/changePhoneNumber.dart';
import 'package:test/report_problem.dart';
import 'map_page.dart';
import 'models/colourSwatch.dart';
import 'package:test/sign_up.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  static const String pageName = 'Settings';

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
        body: const SettingsWidget(),
      ),
    );
  }
}

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => SettingsWidgets();
}

class SettingsWidgets extends State<SettingsWidget> {
  int flex1 = 5;
  int flexText = 8;
  int flexButton = 6;
  int flexThirds = 2;
  bool notificationsSwitch = true;
  bool isVisible = false;
  var email = TextEditingController();
  var phoneNum = TextEditingController();
  var gender = TextEditingController();
  String message = "";

  // change this into an api call to fill the list with the personal information
  List initialValues = [
    'myUsername',
    'first and last name',
    'DOB',
    'myEmail',
    'myNumber',
    'Male',
    true
  ];
  @override
  Widget build(BuildContext context) {
    //List initial values = initialValuesAPI();
    List finalValues = initialValues;
    return Padding(
        padding: EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: flex1, child: const Text("Username:")),
                Expanded(flex: flexText, child: Text(initialValues[0]))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: flex1, child: const Text("Name: ")),
                Expanded(flex: flexText, child: Text(initialValues[1]))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: flex1, child: const Text("Date of Birth: ")),
                Expanded(flex: flexText, child: Text(initialValues[2]))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(children: <Widget>[
              Expanded(
                flex: flex1,
                child: const Text('Gender'),
              ),
              Expanded(flex: flexButton, child: Text(initialValues[5])),
              IconButton(
                icon: const Icon(Icons.arrow_right),
                tooltip: 'Change Gender',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangeGender()),
                  );
                },
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(children: <Widget>[
              Expanded(
                flex: flex1,
                child: const Text('Email'),
              ),
              Expanded(flex: flexButton, child: Text(initialValues[3])),
              IconButton(
                icon: const Icon(Icons.arrow_right),
                tooltip: 'Change email',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangeEmail()),
                  );
                },
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(children: <Widget>[
              Expanded(
                flex: flex1,
                child: const Text('Phone Number'),
              ),
              Expanded(flex: flexButton, child: Text(initialValues[4])),
              IconButton(
                icon: const Icon(Icons.arrow_right),
                tooltip: 'Change Phone Number',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangePhoneNumber()),
                  );
                },
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: flex1, child: const Text("Receive Notifications")),
                Expanded(
                    flex: flexText,
                    child: Switch(
                        // This bool value toggles the switch
                        value: initialValues[6],
                        activeColor: Colours().getPrimarySwatch(),
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            initialValues[6] = value;
                          });
                        }))
              ],
            ),
          ),
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
                  flex: flex1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colours().getPrimarySwatch(),
                        minimumSize: Size(0, 40)),
                    child: const Text('Back'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: flex1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colours().getPrimarySwatch(),
                        minimumSize: Size(0, 40)),
                    child: const Text('Report Issue'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReportProblem()),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

List initialValuesAPI() {
  return [];
}
