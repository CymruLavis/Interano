import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'filters.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  //Call an API to get the users (Lat and long)
  final LatLng _center = const LatLng(43.259100, -79.910730);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: const Color.fromRGBO(75, 113, 210, 1),
          actions: [
            PopupMenuButton(
                // add icon, by default "3 dot" icon
                icon: Icon(Icons.menu),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: ListTile(
                          leading: Icon(Icons.filter), title: Text("Filters")),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: ListTile(
                          leading: Icon(Icons.settings),
                          title: Text("Settings")),
                    ),
                    PopupMenuItem<int>(
                      value: 2,
                      child: ListTile(
                          leading: Icon(Icons.logout), title: Text("Logout")),
                    ),
                  ];
                },
                onSelected: (value) {
                  //Change screens
                  if (value == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FiltersPage()),
                    );
                  } else if (value == 1) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const SettingsPage()),
                    // );
                  } else if (value == 2) {
                    //Log out and go to sign in page
                  }
                }),
          ],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
