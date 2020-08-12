import 'package:bzoozle/models/venue_header_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../settings/colours.dart';

class VenueEditButton extends StatelessWidget {
  const VenueEditButton({Key key, this.venueEditButton}) : super(key: key);
  final VenueHeaderClass venueEditButton;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, venueEditButton.routerName);
        },
        textColor: textColour,
        color: buttonColour,
        elevation: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(flex: 3, child: Text(venueEditButton.buttonText)),
            Flexible(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Text(venueEditButton.lastUpdateName),
                  Text(
                      "${venueEditButton.lastUpdateDate} ${venueEditButton.lastUpdateTime}"),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: Icon(
                  Icons.chevron_right,
                )),
          ],
        ));
  }
}
