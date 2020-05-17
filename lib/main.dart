import 'package:flutter/material.dart';

import 'screens/listings.dart';
import 'screens/main_menu.dart';
import 'settings/colours.dart';
import 'screens/new_venue.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BZOOZLE",
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute: "MainMenu",
      routes: {
        "MainMenu": (context) => MainMenuScreen(),
//        "ListingsScreen": (context) => ListingsScreen(),
        "NewVenueScreen": (context) => NewVenueScreen(),
      },
    );
  }
}
