import 'package:bzoozle/models/listing_card_model.dart';
import 'package:bzoozle/settings/colours.dart';
import 'package:flutter/material.dart';

/*This is the venue detail screen
Purpose: To display the full details for a selected venue (from the listings screen)
Input parameters: listingCard objects*/

class VenueDetailScreen extends StatefulWidget {
  @override
  _VenueDetailScreenState createState() => _VenueDetailScreenState();
}

class _VenueDetailScreenState extends State<VenueDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final ListingCardClass venueDetails =
        ModalRoute.of(context).settings.arguments as ListingCardClass;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColour,
        iconTheme: IconThemeData(color: iconColour),
        title: Text(
          venueDetails.venueName,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textHeaderColour),
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColour,
      body: Container(
        color: backgroundColour,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Hero(
                        tag: venueDetails.venueImage,
                        child: Image(
                          image: AssetImage(venueDetails.venueImage),
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height / 4,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // width: double.infinity,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            fadeColourDark,
                            transparentColour,
                            transparentColour,
                            transparentColour
                          ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
