import 'package:bzoozle/settings/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/venue_model.dart';
import '../settings/myTheme.dart';

/*This is the listing card template
Purpose: To display high level details for each venue to help the user select
 which to explore further by clicking on a card to take them to the full details.
 A long press on a particular section of the card take the user to the edit
 screen, enabling them to update that information for that venue.
Input parameters: listingCard objects*/

class ListingCard extends StatelessWidget {
  const ListingCard({Key key, this.listingCard}) : super(key: key);
  final VenueClass listingCard;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var today = now.weekday;
    String openingTime1 = nextOpeningTime(today: today, session: 1);
    String closingTime1 = nextClosingTime(today: today, session: 1);
    String openingTime2 = nextOpeningTime(today: today, session: 2);
    String closingTime2 = nextClosingTime(today: today, session: 2);
    var nextHH = nextHappyHour();
    dynamic nextHHStart =
        (nextHH == "N/A") ? "N/A" : DateTime.parse(nextHH.split(",")[0]);
    dynamic nextHHEnd =
        (nextHH == "N/A") ? "N/A" : DateTime.parse(nextHH.split(",")[1]);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Container(
        height: cardSize,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: borderColour, width: 1.0)),
          elevation: 16.0,
          borderOnForeground: true,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 12,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                      flex: 30,
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                            ),
                            child: Hero(
                              tag: listingCard.venueImage,
                              child: Image(
                                image: AssetImage(listingCard.venueImage),
                                fit: BoxFit.cover,
                                height: cardSize / 5 * 4,
                                width: double.infinity,
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
                                    fadeColour,
                                    transparentColour,
                                    transparentColour,
                                    transparentColour,
                                    transparentColour
                                  ]),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 2.0, left: 8.0, right: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    listingCard.venueName,
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  Text(
                                    listingCard.venueLocation,
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 10,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: timeBoxOpenToday(
                                today: now,
                                openTime1: openingTime1,
                                openTime2: openingTime2,
                                closeTime1: closingTime1,
                                closeTime2: closingTime2),
                          ),
                          Expanded(
                            child: timeBoxNextHappyHour(
                                today: now,
                                nextHHStart: nextHHStart,
                                nextHHEnd: nextHHEnd),
                          ),
                          Expanded(
                            child: timeBoxHHCountdown(
                                today: now,
                                nextHHStart: nextHHStart,
                                nextHHEnd: nextHHEnd),
                          ),
                          Expanded(
                            child: timeBoxDistance(
                                distance: listingCard.venueDistance),
                          ),
                          Expanded(
                            child: timeBoxPrice(
                                regularPrice: listingCard.venueRegPrice,
                                hHPrice: listingCard.venueHHPrice,
                                textTheme: Theme
                                    .of(context)
                                    .textTheme),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: facilityBox(
                          indicatorSymbol: indicatorSymbol(
                              indicatorSymbol: listingCard.venueInOut),
                          iconImage: "assets/icon_in_out.png"),
                    ),
                    Expanded(
                      child: facilityBox(
                          indicatorSymbol: "assets/green_square.png",
                          iconImage: "assets/icon_views.png"),
                    ),
                    Expanded(
                      child: facilityBox(
                          indicatorSymbol: indicatorSymbol(
                              indicatorSymbol: listingCard.venueFood),
                          iconImage: "assets/icon_food.png"),
                    ),
                    Expanded(
                      child: facilityBox(
                          indicatorSymbol: indicatorSymbol(
                              indicatorSymbol: listingCard.venueSmoking),
                          iconImage: "assets/icon_smoking.png"),
                    ),
                    Expanded(
                      child: facilityBox(
                          indicatorSymbol: indicatorSymbol(
                              indicatorSymbol: listingCard.venueRecMusic),
                          iconImage: "assets/icon_recorded_music.png"),
                    ),
                    Expanded(
                      child: facilityBox(
                          indicatorSymbol: indicatorSymbol(
                              indicatorSymbol: listingCard.venueLiveEnt),
                          iconImage: "assets/icon_live_ent.png"),
                    ),
                    Expanded(
                      child: facilityBox(
                          indicatorSymbol: indicatorSymbol(
                              indicatorSymbol: listingCard.venueCCharge),
                          iconImage: "assets/icon_cover.png"),
                    ),
                    Expanded(
                      child: facilityBox(
                          indicatorSymbol: indicatorSymbol(
                              indicatorSymbol: listingCard.venueDressCode),
                          iconImage: "assets/icon_dresscode.png"),
                    ),
                    Expanded(
                      child: facilityBox(
                          indicatorSymbol: indicatorSymbol(
                              indicatorSymbol: listingCard.venueChildPolicy),
                          iconImage: "assets/icon_child.png"),
                    ),
                    Expanded(
                      child: facilityBox(
                          indicatorSymbol: indicatorSymbol(
                              indicatorSymbol: listingCard.venueAccessibility),
                          iconImage: "assets/icon_accessibility.png"),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: goodForText(
                            goodFor: listingCard.venueGoodForTitle1,
                            textTheme: Theme
                                .of(context)
                                .textTheme),
                      ),
                      Expanded(
                        child: goodForText(
                            goodFor: listingCard.venueGoodForTitle2,
                            textTheme: Theme
                                .of(context)
                                .textTheme),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: goodForText(
                          goodFor: listingCard.venueGoodForTitle3,
                          textTheme: Theme
                              .of(context)
                              .textTheme),
                    ),
                    Expanded(
                      child: goodForText(
                          goodFor: listingCard.venueGoodForTitle4,
                          textTheme: Theme
                              .of(context)
                              .textTheme),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: goodForText(
                            goodFor: listingCard.venueGoodForTitle5,
                            textTheme: Theme
                                .of(context)
                                .textTheme),
                      ),
                      Expanded(
                        child: goodForText(
                            goodFor: listingCard.venueGoodForTitle6,
                            textTheme: Theme
                                .of(context)
                                .textTheme),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String nextOpeningTime({int today, int session}) {
    /*  This function identifies and returns the opening times on the current
    day, for each venue.
    Input parameters: Current date & time, Session indicator (whether session 1 or 2)*/

    //ToDo provide for opening hours that straddle midnight
    String openTime;
    switch (today) {
      case 1:
        {
          if (session == 1) {
            openTime = listingCard.venueOpenMonday1;
          } else {
            openTime = listingCard.venueOpenMonday2;
          }
        }
        break;
      case 2:
        {
          if (session == 1) {
            openTime = listingCard.venueOpenTuesday1;
          } else {
            openTime = listingCard.venueOpenTuesday2;
          }
        }
        break;
      case 3:
        {
          if (session == 1) {
            openTime = listingCard.venueOpenWednesday1;
          } else {
            openTime = listingCard.venueOpenWednesday2;
          }
        }
        break;
      case 4:
        {
          if (session == 1) {
            openTime = listingCard.venueOpenThursday1;
          } else {
            openTime = listingCard.venueOpenThursday2;
          }
        }
        break;
      case 5:
        {
          if (session == 1) {
            openTime = listingCard.venueOpenFriday1;
          } else {
            openTime = listingCard.venueOpenFriday2;
          }
        }
        break;
      case 6:
        {
          if (session == 1) {
            openTime = listingCard.venueOpenSaturday1;
          } else {
            openTime = listingCard.venueOpenSaturday2;
          }
        }
        break;
      case 7:
        {
          if (session == 1) {
            openTime = listingCard.venueOpenSunday1;
          } else {
            openTime = listingCard.venueOpenSunday2;
          }
        }
        break;
    }

    return openTime;
  }

  String nextClosingTime({int today, int session}) {
    /*  This function identifies and returns the closing times on the current
    day, for each venue.
    Input parameters: Current date & time, Session indicator (whether session 1 or 2)*/

    //ToDo provide for opening hours that straddle midnight
    String closeTime;
    switch (today) {
      case 1:
        {
          if (session == 1) {
            closeTime = listingCard.venueCloseMonday1;
          } else {
            closeTime = listingCard.venueCloseMonday2;
          }
        }
        break;
      case 2:
        {
          if (session == 1) {
            closeTime = listingCard.venueCloseTuesday1;
          } else {
            closeTime = listingCard.venueCloseTuesday2;
          }
        }
        break;
      case 3:
        {
          if (session == 1) {
            closeTime = listingCard.venueCloseWednesday1;
          } else {
            closeTime = listingCard.venueCloseWednesday2;
          }
        }
        break;
      case 4:
        {
          if (session == 1) {
            closeTime = listingCard.venueCloseThursday1;
          } else {
            closeTime = listingCard.venueCloseThursday2;
          }
        }
        break;
      case 5:
        {
          if (session == 1) {
            closeTime = listingCard.venueCloseFriday1;
          } else {
            closeTime = listingCard.venueCloseFriday2;
          }
        }
        break;
      case 6:
        {
          if (session == 1) {
            closeTime = listingCard.venueCloseSaturday1;
          } else {
            closeTime = listingCard.venueCloseSaturday2;
          }
        }
        break;
      case 7:
        {
          if (session == 1) {
            closeTime = listingCard.venueCloseSunday1;
          } else {
            closeTime = listingCard.venueCloseSunday2;
          }
        }
        break;
    }
    return closeTime;
  }

  Widget timeBoxOpenToday({DateTime today,
    String openTime1,
    String closeTime1,
    String openTime2,
    String closeTime2}) {
    /*  This function returns the custom widget that displays the opening times
    on the current day, for each venue.
    Input parameters: Current date & time, Session 1 opening date & time,
    Session 1 closing date & time, Session 2 opening date & time,
    Session 1 closing date & time*/

    //ToDo provide for happy hours that straddle midnight
    //ToDo incorporate the problem of opening times straddling midnight
    String times1 = (openTime1 == "") ? "CLOSED" : "$openTime1-$closeTime1";
    String times2 = (openTime2 == "") ? "" : "$openTime2-$closeTime2";
    dynamic openFullDate1 = (openTime1 == "")
        ? ""
        : DateTime.parse(
        "${today.year.toString()}-${today.month.toString().padLeft(
            2, "0")}-${today.day.toString().padLeft(2, "0")} ${openTime1.split(
            ":")[0]}:${openTime1.split(":")[1]}:00");
    dynamic openFullDate2 = (openTime2 == "")
        ? ""
        : DateTime.parse(
        "${today.year.toString()}-${today.month.toString().padLeft(
            2, "0")}-${today.day.toString().padLeft(2, "0")} ${openTime2.split(
            ":")[0]}:${openTime2.split(":")[1]}:00");
    dynamic closeFullDate1 = (openTime1 == "")
        ? ""
        : DateTime.parse(
        "${today.year.toString()}-${today.month.toString().padLeft(
            2, "0")}-${today.day.toString().padLeft(2, "0")} ${closeTime1.split(
            ":")[0]}:${closeTime1.split(":")[1]}:00");
    dynamic closeFullDate2 = (openTime2 == "")
        ? ""
        : DateTime.parse(
        "${today.year.toString()}-${today.month.toString().padLeft(
            2, "0")}-${today.day.toString().padLeft(2, "0")} ${closeTime2.split(
            ":")[0]}:${closeTime2.split(":")[1]}:00");

    Color containerColour;
    String headerText = "Open Today";
// if the venue is closed all day set the background colour to red
    if (times1 == "CLOSED") {
      containerColour = indicator3;
      headerText = "Closed Today";
      // if the venue is open all day set the background colour to green
    } else if (openTime1 == "00:00" && closeTime1 == "00:00") {
      containerColour = indicator1;
      // if the venue has only 1 open session...
    } else if (times2 == "") {
      // if the current time is before 30 mins before opening time OR after
      // closing time set the background colour to red
      if (today.isBefore(openFullDate1.add(Duration(minutes: -30))) ||
          today.isAfter(closeFullDate1)) {
        containerColour = indicator3;
        // if the current time is after opening time and
        // before 30 mins before closing time set the background colour to green
      } else if (today.isAfter(openFullDate1) &&
          today.isBefore(closeFullDate1.add(Duration(minutes: -30)))) {
        containerColour = indicator1;
        // Otherwise set the background colour to orange
      } else {
        containerColour = indicator2;
      }
      // if the venue has 2 opening sessions...
    } else {
      // if the current time is before 30 mins before session 1 opening time OR
      // the current time is after session 1 closing time AND
      // before 30 mins before opening session 1 OR
      // current time is after session 2 close time, set the background colour to red
      if (today.isBefore(openFullDate1.add(Duration(minutes: -30))) ||
          today.isAfter(closeFullDate1) &&
              today.isBefore(openFullDate2.add(Duration(minutes: -30))) ||
          today.isAfter(closeFullDate2)) {
        containerColour = indicator3;
        // if the current time is after session 1 opening time AND
        // before 30 mins before session 1 closing time OR
        // the current time is after session 2 opening time AND
        // before 30 mins before session 2 close time, set the background colour to green
      } else if (today.isAfter(openFullDate1) &&
          today.isBefore(closeFullDate1.add(Duration(minutes: -30))) ||
          today.isAfter(openFullDate2) &&
              today.isBefore(closeFullDate2.add(Duration(minutes: -30)))) {
        containerColour = indicator1;
        //Set the background colour to orange between 30 mins before opening times AND
        // opening time, and between 30 mins before closing times and closing times.
      } else {
        containerColour = indicator2;
      }
    }
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: containerColour,
              borderRadius: BorderRadius.only(topRight: Radius.circular(10.0)),
              border: Border.all(color: borderColour)),
        ),
        Column(
          children: <Widget>[
            Flexible(
              flex: 30,
              child: Container(
                child: Text(
                  headerText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Flexible(
              flex: times2 == "" ? 70 : 35,
              child: Container(
                child: Center(
                  child: Text(
                    times1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.0,
                        height: 0.9,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            (times2 == "")
                ? Container()
                : Flexible(
              flex: 35,
              child: Container(
                child: Center(
                  child: Text(
                    times2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.0,
                        height: 0.9,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget timeBoxNextHappyHour(
      {DateTime today, dynamic nextHHStart, dynamic nextHHEnd}) {
    /*  This function returns the custom widget that displays the day and times
    of the next happy hour for each venue.
    Input parameters: Current date & time, next happy hour start date & time,
    next happy hour end date & time*/

    //ToDo provide for happy hours that straddle midnight
    //ToDo Change text 'Today' to variable day of the week
    Color containerColour = indicator1;
    String mainText = (nextHHStart == "N/A")
        ? "N/A"
        : "${nextHHStart.hour.toString().padLeft(2, "0")}:${nextHHStart.minute
        .toString().padLeft(2, "0")}-${nextHHEnd.hour.toString().padLeft(
        2, "0")}:${nextHHEnd.minute.toString().padLeft(2, "0")}";
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: containerColour, border: Border.all(color: borderColour)),
        ),
        Center(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 30,
                child: Container(
                  child: Text(
                    "Next Happy Hour",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Flexible(
                flex: 20,
                child: Container(
                  child: Text(
                    "Today",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 8.0,
                        height: 0.9,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Flexible(
                flex: 50,
                child: Container(
                  child: Center(
                    child: Text(
                      mainText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0,
                          height: 0.9,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget timeBoxHHCountdown(
      {DateTime today, dynamic nextHHStart, dynamic nextHHEnd}) {
    /*  This function returns the custom widget that displays the countdown
    clock for the next happy hour for each venue.  This currently displays dummy
    data, but the intention is to activate a countdown clock
    Input parameters: Current date & time, next happy hour start date & time,
    next happy hour end date & time*/

    //ToDo Get countdown clock working

    Color containerColour = indicator1;
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: containerColour, border: Border.all(color: borderColour)),
        ),
        Column(
          children: <Widget>[
            Flexible(
              flex: 30,
              child: Container(
                child: Center(
                  child: Text(
                    "HH Countdown",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 20,
              child: Container(
                child: Text(
                  "  D       H      M      S",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 8.0, height: 0.9, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Flexible(
              flex: 50,
              child: Container(
                child: Center(
                  child: Text(
                    "00:03:02:31",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.0,
                        height: 0.9,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget timeBoxDistance({String distance}) {
    /*  This function returns the custom widget that displays the distance
    for each venue.  This currently displays dummy data, but the intention is to
    use live data via a map api, probably Google Maps
    Input parameters: Distance*/
    //ToDo  obtain and display distance data from api (Google Maps)
    Color containerColour = indicator1;
    return Stack(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: containerColour,
                border: Border.all(color: borderColour)),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 30,
                child: Container(
                  child: Text(
                    "Distance",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Flexible(
                flex: 40,
                child: Container(
                  child: Center(
                    child: Text(
                      "0.63",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0,
                          height: 0.9,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 20,
                child: Container(
                  child: Center(
                    child: Text(
                      "miles",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10.0,
                          height: 0.9,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget timeBoxPrice({int regularPrice, int hHPrice, TextTheme textTheme}) {
/*  This function returns the custom widget that displays the relative price
    indicators for regular prices and happy hour prices
    Input parameters: relative price indicators for regular and happy hour prices*/
    //ToDo Expand $ row to fill the container

    Color containerColour = indicator1;
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: containerColour, border: Border.all(color: borderColour)),
        ),
        Column(
          children: <Widget>[
            Container(
              child: Text(
                "Price",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: containerColour,
                          border: Border.all(color: borderColour)),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 1.0, bottom: 2.0),
                            child: Text(
                              "Reg",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 8.0,
                                  height: 0.9,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "\$",
                                style: textTheme.subtitle1,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "\$",
                                      style: TextStyle(
                                          color: (regularPrice >= 2)
                                              ? dollarColour
                                              : reverseDollarColour)),
                                  TextSpan(
                                      text: "\$",
                                      style: TextStyle(
                                          color: (regularPrice >= 3)
                                              ? dollarColour
                                              : reverseDollarColour)),
                                  TextSpan(
                                      text: "\$",
                                      style: TextStyle(
                                          color: (regularPrice >= 4)
                                              ? dollarColour
                                              : reverseDollarColour)),
                                  TextSpan(
                                      text: "\$",
                                      style: TextStyle(
                                          color: (regularPrice >= 5)
                                              ? dollarColour
                                              : reverseDollarColour)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: containerColour,
                          border: Border.all(color: borderColour)),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 1.0, bottom: 2.0),
                            child: Text(
                              "HH",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 8.0,
                                  height: 0.9,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "\$",
                                style: TextStyle(
                                    color: dollarColour,
                                    fontSize: 14.0,
                                    height: 0.9,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "\$",
                                      style: TextStyle(
                                          color: (hHPrice >= 2)
                                              ? dollarColour
                                              : reverseDollarColour)),
                                  TextSpan(
                                      text: "\$",
                                      style: TextStyle(
                                          color: (hHPrice >= 3)
                                              ? dollarColour
                                              : reverseDollarColour)),
                                  TextSpan(
                                      text: "\$",
                                      style: TextStyle(
                                          color: (hHPrice >= 4)
                                              ? dollarColour
                                              : reverseDollarColour)),
                                  TextSpan(
                                      text: "\$",
                                      style: TextStyle(
                                          color: (hHPrice >= 5)
                                              ? dollarColour
                                              : reverseDollarColour)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget facilityBox({String indicatorSymbol, String iconImage}) {
/*  This function returns a stacked image for each of the 10 facility indicator
    symbols
    Input parameters: background image and icon image*/
    return Container(
      height: cardSize / 5,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: backgroundColour, border: Border.all(color: borderColour)),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: Image(
                image: AssetImage(indicatorSymbol),
                fit: BoxFit.cover,
//              width: double.infinity,
//              height: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Image(
                image: AssetImage(iconImage),
                fit: BoxFit.fitHeight,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String indicatorSymbol({String indicatorSymbol}) {
/*  This function assigns the correct background image for each of the facility
    indicator symbols, either a green square, orange octagon, or red circle
    Input parameters: indicatorSymbol*/
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
    /* This function uses the current date and time to calculate the happy hours
    for the coming week by producing a sorted list and returns a string
    consisting of the dates and opening and closing times of the next happy hour
    Input parameters: none*/
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

  Widget goodForText({String goodFor, TextTheme textTheme}) {
/*  This function produces each of the 6 text bullet points at the foot of the
    card, highlighting the major selling points of each venue
    Input parameters: the text to be displayed*/
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 4.0),
          child: Text(
            goodFor,
            style: textTheme.bodyText2,
          ),
        ),
      ),
    );
  }
}
