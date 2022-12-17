import 'dart:html';

import 'package:flutter/material.dart';
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
  int flex2 = 7;
  int flexThirds = 2;
  bool notificationsSwitch = true;
  bool isVisible = false;
  final email = TextEditingController();
  var phoneNum = TextEditingController();
  String gender = "";
  String message = "";

  // change this into an api call to fill the list with the personal information
  List initialValues = [
    'elavis',
    'Ethan Lavis',
    '23/12/2000',
    'elavis@cambriadesign.ca',
    '4168825129',
    'Female',
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: flex1, child: const Text("Username:")),
                Expanded(flex: flex2, child: Text(initialValues[0]))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: flex1, child: const Text("Name: ")),
                Expanded(flex: flex2, child: Text(initialValues[1]))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: flex1, child: const Text("Date of Birth: ")),
                Expanded(flex: flex2, child: Text(initialValues[2]))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(children: <Widget>[
              Expanded(
                flex: flex1,
                child: const Text('Email'),
              ),
              Expanded(
                  flex: flex2,
                  child: TextFormField(
                    initialValue: initialValues[3],
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
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
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(children: <Widget>[
              Expanded(
                flex: flex1,
                child: const Text('Phone Number'),
              ),
              Expanded(
                  flex: flex2,
                  child: TextFormField(
                    // controller: phoneNum,
                    initialValue: initialValues[4],
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
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
          Row(
            children: <Widget>[
              Expanded(flex: flex1, child: const Text('Gender: ')),
              Expanded(
                  flex: flex2,
                  // child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      isExpanded: true,
                      value: initialValues[5],
                      items: [
                        DropdownMenuItem(child: Text("Male"), value: "Male"),
                        DropdownMenuItem(
                          child: Text("Female"),
                          value: "Female",
                        ),
                        DropdownMenuItem(
                          child: Text("Other"),
                          value: "Other",
                        )
                      ],
                      onChanged: (value) {
                        if (value is String) {
                          setState(() {
                            initialValues[5] = value;
                          });
                        }
                      },
                    ),
                  )
                  // ),
                  )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: flex1, child: const Text("Recieve Notifications")),
                Expanded(
                    flex: flex2,
                    child: Switch(
                        // This bool value toggles the switch
                        value: initialValues[6],
                        activeColor: Colours().getPrimarySwatch(),
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            notificationsSwitch = value;
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
                Expanded(
                  flex: flexThirds,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colours().getPrimarySwatch(),
                        minimumSize: Size(0, 40)),
                    child: const Text('Back'),
                    onPressed: () {
                      List finalValues = [
                        initialValues[0],
                        initialValues[1],
                        initialValues[2],
                        email,
                        phoneNum,
                        gender,
                        notificationsSwitch
                      ];
                      if (checkForChanges(initialValues, finalValues) == true) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("You have unsaved changes"),
                                  content: Text(
                                      "Do you want to save these changes? "),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Yes")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyApp()),
                                          );
                                        },
                                        child: Text("No"))
                                  ],
                                ));
                      }
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: flexThirds,
                  child: ElevatedButton(
                    child: const Text("Save"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colours().getPrimarySwatch(),
                        minimumSize: Size(0, 40)),
                    onPressed: () {
                      List finalValues = [
                        initialValues[0],
                        initialValues[1],
                        initialValues[2],
                        email,
                        phoneNum,
                        gender,
                        notificationsSwitch
                      ];
                      //check for change
                      //dialog box to notify about change about to happen
                      //save new information
                      //re validate the account/log out
                      Navigator.push(
                        //check to make sure items are properly filled out and if something has been changed
                        //update personal information in database
                        //send an email to communications

                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                      );
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: flexThirds,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colours().getPrimarySwatch(),
                        minimumSize: Size(0, 40)),
                    child: const Text('Report Issue'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

bool checkForChanges(List initVals, List finVals) {
  bool flag = true;
  // check values in the lists to make sure they are the same
  for (var i = 0; i < initVals.length; i++) {
    if (initVals[i] != finVals[i]) {
      flag = false;
    }
  }
  return flag;
}

void saveChangesAPI() {}

List initialValuesAPI() {
  return [];
}
