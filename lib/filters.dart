import 'package:flutter/material.dart';
import 'models/colourSwatch.dart';
import 'package:test/map_page.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({Key? key}) : super(key: key);
  static const String pageName = 'Filters';

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
        body:
            const FiltersWidget(), //Might need to change to custom scroll view depending on how many filters we come up with
      ),
    );
  }
}

class FiltersWidget extends StatefulWidget {
  const FiltersWidget({Key? key}) : super(key: key);

  @override
  State<FiltersWidget> createState() => FiltersWidgets();
}

class FiltersWidgets extends State<FiltersWidget> {
  final primaryColour = Colours();
  double rangeValue = 5;
  String dropDown = "Restaurant";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(flex: 3, child: const Text('Category: ')),
                Expanded(
                  flex: 6,
                  child: DropdownButtonFormField(
                    value: dropDown,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    )),
                    // isExpanded: true,
                    items: [
                      DropdownMenuItem(
                          child: Text("Restaurant"), value: "Restaurant"),
                      DropdownMenuItem(
                        child: Text("Retail"),
                        value: "Retail",
                      ),
                      DropdownMenuItem(
                        child: Text("Entertainment"),
                        value: "Entertainment",
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
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: const Text('Range (Km):'),
                ),
                Expanded(
                    flex: 6,
                    child: Slider(
                      value: rangeValue,
                      max: 50,
                      min: 1,
                      divisions: 50,
                      label: rangeValue.toString(),
                      onChanged: (double value) {
                        setState(() {
                          rangeValue = value;
                        });
                      },
                    ))
              ],
            ),
            //item type, price min, price max
          ],
        ));
  }
}
