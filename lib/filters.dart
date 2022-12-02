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
  TextEditingController priceLow = TextEditingController();
  TextEditingController priceHigh = TextEditingController();
  TextEditingController keyWords = TextEditingController();

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
                  child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      value: dropDown,
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
                  )),
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
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(children: <Widget>[
                Expanded(flex: 3, child: const Text('Min Price(\$):')),
                Expanded(
                  flex: 6,
                  child: TextField(
                    controller: priceLow,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Price Min (\$)',
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(children: <Widget>[
                Expanded(flex: 3, child: const Text('Max Price(\$):')),
                Expanded(
                  flex: 6,
                  child: TextField(
                    controller: priceHigh,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Price Max (\$)',
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(children: <Widget>[
                Expanded(flex: 3, child: const Text('Key Words:')),
                Expanded(
                  flex: 6,
                  child: TextField(
                    controller: keyWords,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Key words',
                    ),
                  ),
                )
              ]),
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
                          backgroundColor: primaryColour.getPrimarySwatch(),
                          minimumSize: Size(0, 40)),
                      child: const Text('Back'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      child: const Text("Apply"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColour.getPrimarySwatch(),
                          minimumSize: Size(0, 40)),
                      onPressed: () {
                        Navigator.push(
                          //Also run the api
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )

            //price min, price max, key words
          ],
        ));
  }
}
