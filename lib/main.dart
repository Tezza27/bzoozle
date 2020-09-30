import 'package:bzoozle/screens/share_bzoozle.dart';
import 'package:bzoozle/settings/myTheme.dart';
import 'package:flutter/material.dart';

import 'screens/account.dart';
import 'screens/edit_venue.dart';
import 'screens/listings.dart';
import 'screens/main_menu.dart';
import 'screens/new_venue.dart';
import 'screens/talk_to_us.dart';
import 'screens/key_facilities.dart';
import 'screens/venue_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BZOOZLE",
      theme: MyTheme().buildTheme(),
      initialRoute: "MainMenu",
      routes: {
        "MainMenu": (context) => MainMenuScreen(),
        "ListingsScreen": (context) => ListingsScreen(),
        "NewVenueScreen": (context) => NewVenueScreen(),
        "ShareScreen": (context) => ShareBzoozleScreen(),
        "EditVenueScreen": (context) => EditVenueScreen(),
        "AccountScreen": (context) => MyAccountScreen(),
        "TalkToUsScreen": (context) => TalkToUsScreen(),
        "KeyFacilitiesScreen": (context) => KeyFacilitiesScreen(),
        "VenueDetailsScreen": (context) => VenueDetailScreen(),
      },
    );
  }
}
