import 'package:flutter/material.dart';
import 'package:test/login.dart';
import 'package:test/settings.dart';
import 'package:test/sign_up.dart';
import 'models/colourSwatch.dart';

class ChangeGender extends StatelessWidget {
  const ChangeGender({Key? key}) : super(key: key);
  static const String _title = 'Change Gender';

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
  String dropDown = "Male";
  String message = "";
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(flex: 3, child: const Text('Category: ')),
              Expanded(
                flex: 6,
                child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    value: dropDown,
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
                          dropDown = value;
                        });
                      }
                    },
                  ),
                )),
              )
            ],
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
                        // changeGenderAPI(gender);
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

void changeGenderAPI(String gender) {}
