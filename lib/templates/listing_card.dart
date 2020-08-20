import 'package:bzoozle/settings/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/listing_card_model.dart';
import '../settings/colours.dart';

class ListingCard extends StatelessWidget {
  const ListingCard({Key key, this.listingCard}) : super(key: key);
  final ListingCardClass listingCard;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var today = now.weekday;
    String openingTime = nextOpeningTime(today: today);
    String closingTime = nextClosingTime(today: today);
//    String nextHHStart;
//    String nextHHEnd;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Container(
        height: cardSize,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: borderColour, width: 1.0)),
          color: backgroundColour,
          elevation: 16.0,
          borderOnForeground: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 4,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 5,
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                            ),
                            child: Image(
                              image: AssetImage(listingCard.venueImage),
                              fit: BoxFit.cover,
                              height: cardSize / 5 * 4,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            bottom: 00.00,
                            child: Container(
//                        width: double.infinity,
                              height: 45.00,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      fadeColourDark,
                                      transparentColour
                                    ]),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 2.0,
                                    left: 8.0,
                                    right: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      listingCard.venueName,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: orangeText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      listingCard.venueLocation,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: orangeText,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              listingCard.venueGoodFor1,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                  color: orangeText),
                            ),
                            Text(
                              listingCard.venueGoodFor2,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                  color: orangeText),
                            ),
                            Text(
                              listingCard.venueGoodFor3,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                  color: orangeText),
                            ),
                            Text(
                              listingCard.venueGoodFor4,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                  color: orangeText),
                            ),
                            Text(
                              listingCard.venueGoodFor5,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                  color: orangeText),
                            ),
                          ],
                        ),
                      ),
                    ),
//                      Flexible(
//                        flex: 2,
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            sideBox(
//                                headerText: "Open Today",
//                                mainText: "$openingTime - $closingTime",
//                                backgroundColour: indicator3,
//                                cornerRound: 10.0),
//                            sideBox(
//                                headerText: "Next Happy Hour",
//                                mainText: "$openingTime - $closingTime",
//                                backgroundColour: indicator3,
//                                cornerRound: 0.0),
//                            sideBox(
//                                headerText: "HH starts:",
//                                mainText: "$openingTime - $closingTime",
//                                backgroundColour: indicator3,
//                                cornerRound: 0.0),
//                            sideBox(
//                                headerText: "Distance",
//                                mainText: "$openingTime - $closingTime",
//                                backgroundColour: indicator3,
//                                cornerRound: 0.0),
//                          ],
//                        ),
//                      ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    timeBox(
                        headerText: "Open Today",
                        mainText: "$openingTime-$closingTime",
                        backgroundColour: indicator3,
                        cornerRound: 10.0),
                    timeBox(
                        headerText: "Next Happy Hour",
                        mainText: "$openingTime-$closingTime",
                        backgroundColour: indicator3,
                        cornerRound: 0.0),
                    timeBox(
                        headerText: "HH starts:",
                        mainText: "$openingTime-$closingTime",
                        backgroundColour: indicator3,
                        cornerRound: 0.0),
                    timeBox(
                        headerText: "Distance",
                        mainText: "$openingTime-$closingTime",
                        backgroundColour: indicator3,
                        cornerRound: 0.0),
                    timeBox(
                        headerText: "Price",
                        mainText: "$openingTime-$closingTime",
                        backgroundColour: indicator3,
                        cornerRound: 0.0),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    facilityBox(
                        indicatorSymbol: indicatorSymbol(
                            indicatorSymbol: listingCard.venueInOut),
                        iconImage: "assets/icon_in_out.png",
                        cornerL: 10.0,
                        cornerR: 0.0),
                    facilityBox(
                        indicatorSymbol: "assets/green_square.png",
                        iconImage: "assets/icon_views.png",
                        cornerL: 0.0,
                        cornerR: 0.0),
                    facilityBox(
                        indicatorSymbol: indicatorSymbol(
                            indicatorSymbol: listingCard.venueFood),
                        iconImage: "assets/icon_food.png",
                        cornerL: 0.0,
                        cornerR: 0.0),
                    facilityBox(
                        indicatorSymbol: indicatorSymbol(
                            indicatorSymbol: listingCard.venueSmoking),
                        iconImage: "assets/icon_smoking.png",
                        cornerL: 0.0,
                        cornerR: 0.0),
                    facilityBox(
                        indicatorSymbol: indicatorSymbol(
                            indicatorSymbol: listingCard.venueRecMusic),
                        iconImage: "assets/icon_recorded_music.png",
                        cornerL: 0.0,
                        cornerR: 0.0),
                    facilityBox(
                        indicatorSymbol: indicatorSymbol(
                            indicatorSymbol: listingCard.venueLiveEnt),
                        iconImage: "assets/icon_live_ent.png",
                        cornerL: 0.0,
                        cornerR: 0.0),
                    facilityBox(
                        indicatorSymbol: indicatorSymbol(
                            indicatorSymbol: listingCard.venueCCharge),
                        iconImage: "assets/icon_cover.png",
                        cornerL: 0.0,
                        cornerR: 0.0),
                    facilityBox(
                        indicatorSymbol: indicatorSymbol(
                            indicatorSymbol: listingCard.venueDressCode),
                        iconImage: "assets/icon_dresscode.png",
                        cornerL: 0.0,
                        cornerR: 0.0),
                    facilityBox(
                        indicatorSymbol: indicatorSymbol(
                            indicatorSymbol: listingCard.venueChildPolicy),
                        iconImage: "assets/icon_child.png",
                        cornerL: 0.0,
                        cornerR: 0.0),
                    facilityBox(
                        indicatorSymbol: indicatorSymbol(
                            indicatorSymbol: listingCard.venueAccessibility),
                        iconImage: "assets/icon_accessibility.png",
                        cornerL: 0.0,
                        cornerR: 10.0),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String nextOpeningTime({int today}) {
    String openTime;
    switch (today) {
      case 1:
        {
          openTime = listingCard.venueOpenMonday1;
        }
        break;
      case 2:
        {
          openTime = listingCard.venueOpenTuesday1;
        }
        break;
      case 3:
        {
          openTime = listingCard.venueOpenWednesday1;
        }
        break;
      case 4:
        {
          openTime = listingCard.venueOpenThursday1;
        }
        break;
      case 5:
        {
          openTime = listingCard.venueOpenFriday1;
        }
        break;
      case 6:
        {
          openTime = listingCard.venueOpenSaturday1;
        }
        break;
      case 7:
        {
          openTime = listingCard.venueOpenSunday1;
        }
        break;
    }
    return openTime;
  }

  String nextClosingTime({int today}) {
    String closeTime;
    switch (today) {
      case 1:
        {
          closeTime = listingCard.venueCloseMonday1;
        }
        break;
      case 2:
        {
          closeTime = listingCard.venueCloseTuesday1;
        }
        break;
      case 3:
        {
          closeTime = listingCard.venueCloseWednesday1;
        }
        break;
      case 4:
        {
          closeTime = listingCard.venueCloseThursday1;
        }
        break;
      case 5:
        {
          closeTime = listingCard.venueCloseFriday1;
        }
        break;
      case 6:
        {
          closeTime = listingCard.venueCloseSaturday1;
        }
        break;
      case 7:
        {
          closeTime = listingCard.venueCloseSunday1;
        }
        break;
    }
    return closeTime;
  }

  Widget timeBox({String headerText,
    String mainText,
    Color backgroundColour,
    double cornerRound}) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: backgroundColour,
                border: Border.all(color: borderColour)),
          ),
          Positioned(
            top: 00.00,
            child: Container(
//                            width: double.infinity,
              height: 20.00,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.only(topRight: Radius.circular(cornerRound)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [fadeColour, transparentColour]),
              ),
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                Text(
                  headerText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  mainText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget facilityBox({String indicatorSymbol,
    String iconImage,
    double cornerL,
    double cornerR}) {
    return Expanded(
      child: Container(
        height: cardSize / 5,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(cornerL),
                bottomRight: Radius.circular(cornerR)),
            color: backgroundColour,
            border: Border.all(color: borderColour)),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image(
                image: AssetImage(indicatorSymbol),
                fit: BoxFit.cover,
//              width: double.infinity,
//              height: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image(
                image: AssetImage(iconImage),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String indicatorSymbol({String indicatorSymbol}) {
    String returnSymbol;
    switch (indicatorSymbol) {
      case "1":
        {
          returnSymbol = "assets/green_square.png";
        }
        break;
      case "2":
        {
          returnSymbol = "assets/orange_octagon.png";
        }
        break;
      case "3":
        {
          returnSymbol = "assets/red_circle.png";
        }
        break;
    }
    return returnSymbol;
  }

  String nextHappyHour(int today, String hour, DateTime time) {
    String nextHHTime = "NONE";
    List<DateTime> startHHList = List<DateTime>();
    List<DateTime> endHHList = List<DateTime>();


    TimeOfDay mondayHHTime1 = TimeOfDay(
        hour: int.parse(listingCard.venueHHStartMonday1.split(":")[0]),
        minute: int.parse(listingCard.venueHHStartMonday1.split(":")[1]));
    for (int i = 0; i < 7; i++) {
      int daysToAdd = 7 - today - i - 1;
      if (daysToAdd < 0) {
        daysToAdd = daysToAdd * -1;
      }
    }
//    List<String> startHHList = [
//      listingCard.venueHHStartMonday1,
//      listingCard.venueHHStartMonday2,
//      listingCard.venueHHStartTuesday1,
//      listingCard.venueHHStartTuesday2,
//      listingCard.venueHHStartWednesday1,
//      listingCard.venueHHStartWednesday2,
//      listingCard.venueHHStartThursday1,
//      listingCard.venueHHStartThursday2,
//      listingCard.venueHHStartFriday1,
//      listingCard.venueHHStartFriday2,
//      listingCard.venueHHStartSaturday1,
//      listingCard.venueHHStartSaturday2,
//      listingCard.venueHHStartSunday1,
//      listingCard.venueHHStartSunday2,
//    ];
//    List<String> endHHList = [
//      listingCard.venueHHEndMonday1,
//      listingCard.venueHHEndMonday2,
//      listingCard.venueHHEndTuesday1,
//      listingCard.venueHHEndTuesday2,
//      listingCard.venueHHEndWednesday1,
//      listingCard.venueHHEndWednesday2,
//      listingCard.venueHHEndThursday1,
//      listingCard.venueHHEndThursday2,
//      listingCard.venueHHEndFriday1,
//      listingCard.venueHHEndFriday2,
//      listingCard.venueHHEndSaturday1,
//      listingCard.venueHHEndSaturday2,
//      listingCard.venueHHEndSunday1,
//      listingCard.venueHHEndSunday2,
//    ];


//    switch (today) {
//      case 1:
//        {
//          if (listingCard.venueHHStartMonday1 == ""){
//
//          }
//          nextHHTime = listingCard.venueHHStartMonday1;
//        }
//        break;
//      case 2:
//        {
//          nextHHTime = listingCard.venueCloseTuesday1;
//        }
//        break;
//      case 3:
//        {
//          nextHHTime = listingCard.venueCloseWednesday1;
//        }
//        break;
//      case 4:
//        {
//          nextHHTime = listingCard.venueCloseThursday1;
//        }
//        break;
//      case 5:
//        {
//          nextHHTime = listingCard.venueCloseFriday1;
//        }
//        break;
//      case 6:
//        {
//          nextHHTime = listingCard.venueCloseSaturday1;
//        }
//        break;
//      case 7:
//        {
//          nextHHTime = listingCard.venueCloseSunday1;
//        }
//        break;
//    }

    return nextHHTime;
  }
}
