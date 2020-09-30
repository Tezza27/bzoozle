import 'package:bzoozle/models/venue_model.dart';
import 'package:bzoozle/settings/myTheme.dart';
import 'package:bzoozle/templates/myCard.dart';
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
    final VenueClass venueDetails =
        ModalRoute.of(context).settings.arguments as VenueClass;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: iconColour),
        title: Text(
          venueDetails.venueName,
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColour,
      body: Container(
        color: backgroundColour,
        child: SingleChildScrollView(
          child: Column(
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 4,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Container(
                  width: double.infinity,
                  child: MyCard(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 8.0, right: 8.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 8.0, right: 8.0),
                            child: Text(
                              "Where to Find Us:",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline2,
                            ),
                          ),
                          (venueDetails.venueLocation.length == 0)
                              ? SizedBox.shrink()
                              : Text(
                            venueDetails.venueLocation,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                          ),
                          (venueDetails.venueAddress1.isEmpty)
                              ? SizedBox.shrink()
                              : Text(
                            venueDetails.venueAddress1,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                          ),
                          (venueDetails.venueAddress2.isEmpty)
                              ? SizedBox.shrink()
                              : Text(
                            venueDetails.venueAddress2,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                          ),
                          (venueDetails.venueArea.length == 0)
                              ? SizedBox.shrink()
                              : Text(
                            venueDetails.venueArea,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                          ),
                          (venueDetails.venueDistrict.length == 0)
                              ? SizedBox.shrink()
                              : Text(
                            venueDetails.venueDistrict,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                          ),
                          (venueDetails.venueCity.length == 0)
                              ? SizedBox.shrink()
                              : Text(
                            venueDetails.venueCity,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                          ),
                          (venueDetails.venuePostCode.length == 0)
                              ? SizedBox.shrink()
                              : Text(
                            venueDetails.venuePostCode,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                          ),
                          (venueDetails.venueDirections == null ||
                              venueDetails.venueDirections.trim() == "")
                              ? SizedBox.shrink()
                              : Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 2.0),
                            child: Text(
                              venueDetails.venueDirections,
                              softWrap: true,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Container(
                  width: double.infinity,
                  child: Card(

                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 8.0, right: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 8.0, right: 8.0),
                            child: Text(
                              "Good for:",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline2,
                            ),
                          ),
                          (venueDetails.venueGoodForTitle1 == null ||
                              venueDetails.venueGoodForTitle1.trim() == "")
                              ? SizedBox.shrink()
                              : goodForWidget(
                              goodForTitle: venueDetails.venueGoodForTitle1,
                              goodForDescription:
                              venueDetails.venueGoodForDescription1,
                              textTheme: Theme
                                  .of(context)
                                  .textTheme),
                          (venueDetails.venueGoodForTitle2 == null ||
                              venueDetails.venueGoodForTitle2.trim() == "")
                              ? SizedBox.shrink()
                              : goodForWidget(
                              goodForTitle: venueDetails.venueGoodForTitle2,
                              goodForDescription:
                              venueDetails.venueGoodForDescription2,
                              textTheme: Theme
                                  .of(context)
                                  .textTheme),
                          (venueDetails.venueGoodForTitle3 == null ||
                              venueDetails.venueGoodForTitle3.trim() == "")
                              ? SizedBox.shrink()
                              : goodForWidget(
                              goodForTitle: venueDetails.venueGoodForTitle3,
                              goodForDescription:
                              venueDetails.venueGoodForDescription3,
                              textTheme: Theme
                                  .of(context)
                                  .textTheme),
                          (venueDetails.venueGoodForTitle4 == null ||
                              venueDetails.venueGoodForTitle4.trim() == "")
                              ? SizedBox.shrink()
                              : goodForWidget(
                              goodForTitle: venueDetails.venueGoodForTitle4,
                              goodForDescription:
                              venueDetails.venueGoodForDescription4,
                              textTheme: Theme
                                  .of(context)
                                  .textTheme),
                          (venueDetails.venueGoodForTitle5 == null ||
                              venueDetails.venueGoodForTitle5.trim() == "")
                              ? SizedBox.shrink()
                              : goodForWidget(
                              goodForTitle: venueDetails.venueGoodForTitle5,
                              goodForDescription:
                              venueDetails.venueGoodForDescription5,
                              textTheme: Theme
                                  .of(context)
                                  .textTheme),
                          (venueDetails.venueGoodForTitle6 == null ||
                              venueDetails.venueGoodForTitle6.trim() == "")
                              ? SizedBox.shrink()
                              : goodForWidget(
                              goodForTitle: venueDetails.venueGoodForTitle6,
                              goodForDescription:
                              venueDetails.venueGoodForDescription6,
                              textTheme: Theme
                                  .of(context)
                                  .textTheme),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Container(
                  width: double.infinity,
                  child: Card(

                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 8.0, right: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 8.0, right: 8.0),
                            child: Text(
                              "What to Expect:",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline2,
                            ),
                          ),
                          Text(
                            venueDetails.venueDescription,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget goodForWidget(
      {String goodForTitle, String goodForDescription, TextTheme textTheme}) {
    return Container(
      child: Column(children: <Widget>[
        Text(goodForTitle, style: textTheme.headline2),
        Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 4.0),
          child: Text(goodForDescription, style: textTheme.bodyText1),
        ),
      ],
      ),
    );
  }
}
