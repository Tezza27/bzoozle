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

  Widget timeBox(
      {String headerText,
      String mainText,
      Color backgroundColour,
      double cornerRound}) {
    if (headerText == "Next Happy Hour") {
      String nextHH = nextHappyHour();
      if (nextHH == "N/A") {
        mainText = "N/A";
      } else {
        DateTime nextHHStart = DateTime.parse(nextHH.split(",")[0]);
        DateTime nextHHEnd = DateTime.parse(nextHH.split(",")[1]);
        mainText =
            "${nextHHStart.hour.toString()}:${nextHHStart.minute.toString().padRight(2, "0")}-${nextHHEnd.hour.toString()}:${nextHHEnd.minute.toString().padRight(2, "0")}";
        String Test = "BOB";
//        mainText =
//            "${nextHHStart.weekday.toString()} \n ${nextHHStart.hour.toString()}:${nextHHStart.minute.toString()}-${nextHHEnd.hour.toString()}:${nextHHEnd.minute.toString()}";
      }
    }
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

  String nextHappyHour() {
    String nextHHTime = "N/A";
    List<dynamic> startHHList = List<dynamic>();
    List<dynamic> endHHList = List<dynamic>();
    DateTime now = DateTime.now();
    int today = now.weekday;
    dynamic startHHTime;
    dynamic endHHTime;
    int daysToAdd = 0;
    for (int i = 0; i < 7; i++) {
      daysToAdd = (i + 1 < today) ? 8 - today + i : i + 1 - today;
      switch (i) {
        case 0:
          {
            if (listingCard.venueHHStartMonday1 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHStartMonday1.split(":")[0]),
                  int.parse(listingCard.venueHHStartMonday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndMonday1.split(":")[0]),
                  int.parse(listingCard.venueHHEndMonday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);

            if (listingCard.venueHHStartMonday2 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHStartMonday2.split(":")[0]),
                  int.parse(listingCard.venueHHStartMonday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndMonday2.split(":")[0]),
                  int.parse(listingCard.venueHHEndMonday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);
          }
          break;
        case 1:
          {
            if (listingCard.venueHHStartTuesday1 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHStartTuesday1.split(":")[0]),
                  int.parse(listingCard.venueHHStartTuesday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndTuesday1.split(":")[0]),
                  int.parse(listingCard.venueHHEndTuesday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);

            if (listingCard.venueHHStartTuesday2 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHStartTuesday2.split(":")[0]),
                  int.parse(listingCard.venueHHStartTuesday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndTuesday2.split(":")[0]),
                  int.parse(listingCard.venueHHEndTuesday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);
          }
          break;
        case 2:
          {
            if (listingCard.venueHHStartWednesday1 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(
                      listingCard.venueHHStartWednesday1.split(":")[0]),
                  int.parse(
                      listingCard.venueHHStartWednesday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndWednesday1.split(":")[0]),
                  int.parse(listingCard.venueHHEndWednesday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);

            if (listingCard.venueHHStartWednesday2 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(
                      listingCard.venueHHStartWednesday2.split(":")[0]),
                  int.parse(
                      listingCard.venueHHStartWednesday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndWednesday2.split(":")[0]),
                  int.parse(listingCard.venueHHEndWednesday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);
          }
          break;
        case 3:
          {
            if (listingCard.venueHHStartThursday1 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(
                      listingCard.venueHHStartThursday1.split(":")[0]),
                  int.parse(
                      listingCard.venueHHStartThursday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndThursday1.split(":")[0]),
                  int.parse(listingCard.venueHHEndThursday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);

            if (listingCard.venueHHStartThursday2 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(
                      listingCard.venueHHStartThursday2.split(":")[0]),
                  int.parse(
                      listingCard.venueHHStartThursday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndThursday2.split(":")[0]),
                  int.parse(listingCard.venueHHEndThursday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);
          }
          break;
        case 4:
          {
            if (listingCard.venueHHStartFriday1 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHStartFriday1.split(":")[0]),
                  int.parse(listingCard.venueHHStartFriday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndFriday1.split(":")[0]),
                  int.parse(listingCard.venueHHEndFriday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);

            if (listingCard.venueHHStartFriday2 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHStartFriday2.split(":")[0]),
                  int.parse(listingCard.venueHHStartFriday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndFriday2.split(":")[0]),
                  int.parse(listingCard.venueHHEndFriday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);
          }
          break;
        case 5:
          {
            if (listingCard.venueHHStartSaturday1 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(
                      listingCard.venueHHStartSaturday1.split(":")[0]),
                  int.parse(
                      listingCard.venueHHStartSaturday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndSaturday1.split(":")[0]),
                  int.parse(listingCard.venueHHEndSaturday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);

            if (listingCard.venueHHStartSaturday2 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(
                      listingCard.venueHHStartSaturday2.split(":")[0]),
                  int.parse(
                      listingCard.venueHHStartSaturday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndSaturday2.split(":")[0]),
                  int.parse(listingCard.venueHHEndSaturday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);
          }
          break;

        case 6:
          {
            if (listingCard.venueHHStartSunday1 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHStartSunday1.split(":")[0]),
                  int.parse(listingCard.venueHHStartSunday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndSunday1.split(":")[0]),
                  int.parse(listingCard.venueHHEndSunday1.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);

            if (listingCard.venueHHStartSunday2 == "") {
              startHHTime = "N/A";
              endHHTime = "N/A";
            } else {
              startHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHStartSunday2.split(":")[0]),
                  int.parse(listingCard.venueHHStartSunday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              endHHTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  int.parse(listingCard.venueHHEndSunday2.split(":")[0]),
                  int.parse(listingCard.venueHHEndSunday2.split(":")[1]))
                  .add(Duration(days: daysToAdd));
              if (startHHTime.isAfter(endHHTime)) {
                endHHTime = endHHTime.add(Duration(days: 1));
              }
            }
            startHHList.add(startHHTime);
            endHHList.add(endHHTime);
          }
          break;
      }
    }
    print(startHHList);
    startHHList.sort();
    print(startHHList);
    print(endHHList);
    endHHList.sort();
    print(endHHList);

    for (int i = 0; i < 14; i++) {
      if (startHHList[i] != "N/A") {
        if (now.isBefore(endHHList[i])) {
          nextHHTime =
          "${startHHList[i].toString()},${endHHList[i].toString()}";
          break;
        }
      }
    }

    return nextHHTime;
  }
}
