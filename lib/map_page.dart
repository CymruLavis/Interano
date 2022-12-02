import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test/login.dart';
import 'filters.dart';
import 'models/colourSwatch.dart';

enum MenuItem {
  filter,
  settings,
  logout,
}

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
          backgroundColor: Colours().getAppBarColor(),
          actions: [
            PopupMenuButton<MenuItem>(
                icon: Icon(Icons.menu),
                onSelected: (value) {
                  if (value == MenuItem.filter) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FiltersPage()),
                    );
                  } else if (value == MenuItem.settings) {
                  } else if (value == MenuItem.logout) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                          value: MenuItem.filter,
                          child: ListTile(
                            leading: Icon(Icons.filter),
                            title: Text("Filters"),
                          )),
                      PopupMenuItem(
                          value: MenuItem.settings,
                          child: ListTile(
                            leading: Icon(Icons.settings),
                            title: Text("Settings"),
                          )),
                      PopupMenuItem(
                          value: MenuItem.logout,
                          child: ListTile(
                            leading: Icon(Icons.logout),
                            title: Text("Logout"),
                          )),
                    ])
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
