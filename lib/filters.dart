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
          backgroundColor: const Color.fromRGBO(75, 113, 210, 1),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text('Store Type: '),
                //Dropdown
              ],
            ),
            Row(
              children: <Widget>[
                const Text('Item Type:'),
                //Input box
              ],
            ),
            Row(
              children: <Widget>[
                const Text('Price Min (\$): '),
                // Input box
              ],
            ),
            Row(
              children: <Widget>[
                const Text('Price Max (\$): '),
                //Input box
              ],
            ),
            Row(
              children: <Widget>[
                const Text('Range (Km):'),
                Slider(
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
                )
              ],
            ),
          ],
        ));
  }
}
