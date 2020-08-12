import 'package:bzoozle/lists/venue_edit_headers.dart';
import 'package:bzoozle/templates/venue_edit_button.dart';
import 'package:flutter/material.dart';
import 'package:bzoozle/settings/colours.dart';

class EditVenueScreen extends StatefulWidget {
  @override
  _EditVenueScreenState createState() => _EditVenueScreenState();
}

class _EditVenueScreenState extends State<EditVenueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColour,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 2.0,
            bottom: 2.0,
            left: 8.0,
            right: 8.0,
          ),
          child: ListView.builder(
            itemCount: venueHeaderList.length,
            itemBuilder: (context, index) {
              return VenueEditButton(
                venueEditButton: venueHeaderList[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
