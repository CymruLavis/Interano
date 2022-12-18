import 'dart:html';

import 'package:flutter/material.dart';
import 'package:test/settings.dart';
import 'map_page.dart';
import 'models/colourSwatch.dart';
import 'package:test/sign_up.dart';

class ReportProblem extends StatelessWidget {
  const ReportProblem({Key? key}) : super(key: key);
  static const String pageName = 'Report Problem';

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
        body: const ReportProblemWidget(),
      ),
    );
  }
}

class ReportProblemWidget extends StatefulWidget {
  const ReportProblemWidget({Key? key}) : super(key: key);

  @override
  State<ReportProblemWidget> createState() => ReportProblemWidgets();
}

class ReportProblemWidgets extends State<ReportProblemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: TextField(
              maxLength: 250,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
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
                        //api to send feedback
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      child: const Text("Send"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colours().getPrimarySwatch(),
                          minimumSize: Size(0, 40)),
                      onPressed: () {
                        feedbackAPI();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Settings()),
                        );
                      },
                    ),
                  ),
                ],
              )),
        ]));
  }
}

void feedbackAPI() {}
