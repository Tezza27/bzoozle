import 'package:bzoozle/lists/key_list.dart';
import 'package:bzoozle/models/venue_model.dart';
import 'package:bzoozle/settings/myTheme.dart';
import 'package:flutter/cupertino.dart';
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
        actions: <Widget>[
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "EditVenueScreen",
                      arguments: venueDetails);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(
                    Icons.edit,
                    color: iconColour,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "KeyFacilitiesScreen");
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Icon(
                    Icons.vpn_key,
                    color: iconColour,
                  ),
                ),
              ),
            ],
          )
        ],
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
                      height: MediaQuery.of(context).size.height / 4,
                      width: double.infinity,
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
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 8.0, right: 8.0),
                            child: Text(
                              "Where to Find Us:",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          (venueDetails.venueLocation.length == 0)
                              ? SizedBox.shrink()
                              : Text(
                                  venueDetails.venueLocation,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                          (venueDetails.venueAddress1.isEmpty)
                              ? SizedBox.shrink()
                              : Text(
                                  venueDetails.venueAddress1,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                          (venueDetails.venueAddress2.isEmpty)
                              ? SizedBox.shrink()
                              : Text(
                                  venueDetails.venueAddress2,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                          (venueDetails.venueArea.length == 0)
                              ? SizedBox.shrink()
                              : Text(
                                  venueDetails.venueArea,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                          (venueDetails.venueDistrict.length == 0)
                              ? SizedBox.shrink()
                              : Text(
                                  venueDetails.venueDistrict,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                          (venueDetails.venueCity.length == 0)
                              ? SizedBox.shrink()
                              : Text(
                                  venueDetails.venueCity,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                          (venueDetails.venuePostCode.length == 0)
                              ? SizedBox.shrink()
                              : Text(
                                  venueDetails.venuePostCode,
                                  style: Theme.of(context).textTheme.bodyText1,
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
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
                              "Opening Times",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline2,
                            ),
                          ),
                          timesTable(
                              monStart1: venueDetails.venueOpenMonday1,
                              monEnd1: venueDetails.venueCloseMonday1,
                              tueStart1: venueDetails.venueOpenTuesday1,
                              tueEnd1: venueDetails.venueCloseTuesday1,
                              wedStart1: venueDetails.venueOpenWednesday1,
                              wedEnd1: venueDetails.venueCloseWednesday1,
                              thuStart1: venueDetails.venueOpenThursday1,
                              thuEnd1: venueDetails.venueCloseThursday1,
                              friStart1: venueDetails.venueOpenFriday1,
                              friEnd1: venueDetails.venueCloseFriday1,
                              satStart1: venueDetails.venueOpenSaturday1,
                              satEnd1: venueDetails.venueCloseSaturday1,
                              sunStart1: venueDetails.venueOpenSunday1,
                              sunEnd1: venueDetails.venueCloseSunday1,
                              monStart2: venueDetails.venueOpenMonday2,
                              monEnd2: venueDetails.venueCloseMonday2,
                              tueStart2: venueDetails.venueOpenTuesday2,
                              tueEnd2: venueDetails.venueCloseTuesday2,
                              wedStart2: venueDetails.venueOpenWednesday2,
                              wedEnd2: venueDetails.venueCloseWednesday2,
                              thuStart2: venueDetails.venueOpenThursday2,
                              thuEnd2: venueDetails.venueCloseThursday2,
                              friStart2: venueDetails.venueOpenFriday2,
                              friEnd2: venueDetails.venueCloseFriday2,
                              satStart2: venueDetails.venueOpenSaturday2,
                              satEnd2: venueDetails.venueCloseSaturday2,
                              sunStart2: venueDetails.venueOpenSunday2,
                              sunEnd2: venueDetails.venueCloseSunday2),
                          venueDetails.venueOpeningTimesNotes == ""
                              ? Container()
                              : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                    left: 8.0,
                                    right: 8.0),
                                child: Text(
                                  "Please Note",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline4,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                    left: 8.0,
                                    right: 8.0),
                                child: Text(
                                  venueDetails.venueOpeningTimesNotes,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText1,
                                ),
                              ),
                            ],
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
                              "Happy Hours",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline2,
                            ),
                          ),
                          timesTable(
                              monStart1: venueDetails.venueHHStartMonday1,
                              monEnd1: venueDetails.venueHHEndMonday1,
                              tueStart1: venueDetails.venueHHStartTuesday1,
                              tueEnd1: venueDetails.venueHHEndTuesday1,
                              wedStart1: venueDetails.venueHHStartWednesday1,
                              wedEnd1: venueDetails.venueHHEndWednesday1,
                              thuStart1: venueDetails.venueHHStartThursday1,
                              thuEnd1: venueDetails.venueHHEndThursday1,
                              friStart1: venueDetails.venueHHStartFriday1,
                              friEnd1: venueDetails.venueHHEndFriday1,
                              satStart1: venueDetails.venueHHStartSaturday1,
                              satEnd1: venueDetails.venueHHEndSaturday1,
                              sunStart1: venueDetails.venueHHStartSunday1,
                              sunEnd1: venueDetails.venueHHEndSunday1,
                              monStart2: venueDetails.venueHHStartMonday2,
                              monEnd2: venueDetails.venueHHEndMonday2,
                              tueStart2: venueDetails.venueHHStartTuesday2,
                              tueEnd2: venueDetails.venueHHEndTuesday2,
                              wedStart2: venueDetails.venueHHStartWednesday2,
                              wedEnd2: venueDetails.venueHHEndWednesday2,
                              thuStart2: venueDetails.venueHHStartThursday2,
                              thuEnd2: venueDetails.venueHHEndThursday2,
                              friStart2: venueDetails.venueHHStartFriday2,
                              friEnd2: venueDetails.venueHHEndFriday2,
                              satStart2: venueDetails.venueHHStartSaturday2,
                              satEnd2: venueDetails.venueHHEndSaturday2,
                              sunStart2: venueDetails.venueHHStartSunday2,
                              sunEnd2: venueDetails.venueHHEndSunday2),
                          venueDetails.venueHHNotes == ""
                              ? Container()
                              : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                    left: 8.0,
                                    right: 8.0),
                                child: Text(
                                  "Happy Hour Offers",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline4,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                    left: 8.0,
                                    right: 8.0),
                                child: Text(
                                  venueDetails.venueHHNotes,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText1,
                                ),
                              ),
                            ],
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
                              "Facilities & Policies",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline2,
                            ),
                          ),
                          facilityWidget(
                              index: keySymbolList.indexWhere(
                                      (keySymbolClass) =>
                                      keySymbolClass.facilityName.contains(
                                          "InOut${venueDetails.venueInOut}")),
                              description: venueDetails.venueInOutNote),
                          facilityWidget(
                              index: keySymbolList.indexWhere(
                                      (keySymbolClass) =>
                                      keySymbolClass.facilityName.contains(
                                          "Views${venueDetails.venueViews}")),
                              description: venueDetails.venueViewsNote),
                          facilityWidget(
                              index: keySymbolList.indexWhere(
                                      (keySymbolClass) =>
                                      keySymbolClass.facilityName.contains(
                                          "Food${venueDetails.venueFood}")),
                              description: venueDetails.venueFoodNote),
                          facilityWidget(
                              index: keySymbolList.indexWhere((
                                  keySymbolClass) =>
                                  keySymbolClass.facilityName.contains(
                                      "Smoking${venueDetails.venueSmoking}")),
                              description: venueDetails.venueSmokingNote),
                          facilityWidget(
                              index: keySymbolList.indexWhere((
                                  keySymbolClass) =>
                                  keySymbolClass.facilityName.contains(
                                      "RecMusic${venueDetails.venueRecMusic}")),
                              description: venueDetails.venueRecMusicNote),
                          facilityWidget(
                              index: keySymbolList.indexWhere((
                                  keySymbolClass) =>
                                  keySymbolClass.facilityName.contains(
                                      "LiveEnt${venueDetails.venueLiveEnt}")),
                              description: venueDetails.venueLiveEntNote),
                          facilityWidget(
                              index: keySymbolList.indexWhere((
                                  keySymbolClass) =>
                                  keySymbolClass.facilityName.contains(
                                      "CCharge${venueDetails.venueCCharge}")),
                              description: venueDetails.venueCChargeNote),
                          facilityWidget(
                              index: keySymbolList.indexWhere((
                                  keySymbolClass) =>
                                  keySymbolClass.facilityName.contains(
                                      "DressCode${venueDetails
                                          .venueDressCode}")),
                              description: venueDetails.venueDressCodeNote),
                          facilityWidget(
                              index: keySymbolList.indexWhere((
                                  keySymbolClass) =>
                                  keySymbolClass.facilityName.contains(
                                      "ChildPolicy${venueDetails
                                          .venueChildPolicy}")),
                              description: venueDetails.venueChildPolicyNote),
                          facilityWidget(
                              index: keySymbolList.indexWhere((
                                  keySymbolClass) =>
                                  keySymbolClass.facilityName.contains(
                                      "Accessibility${venueDetails
                                          .venueAccessibility}")),
                              description: venueDetails.venueAccessibilityNote),
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
      child: Column(
        children: <Widget>[
          Text(goodForTitle, style: textTheme.headline4),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 4.0),
            child: Text(goodForDescription, style: textTheme.bodyText1),
          ),
        ],
      ),
    );
  }

  Widget timesTable({String monStart1,
    String monEnd1,
    String tueStart1,
    String tueEnd1,
    String wedStart1,
    String wedEnd1,
    String thuStart1,
    String thuEnd1,
    String friStart1,
    String friEnd1,
    String satStart1,
    String satEnd1,
    String sunStart1,
    String sunEnd1,
    String monStart2,
    String monEnd2,
    String tueStart2,
    String tueEnd2,
    String wedStart2,
    String wedEnd2,
    String thuStart2,
    String thuEnd2,
    String friStart2,
    String friEnd2,
    String satStart2,
    String satEnd2,
    String sunStart2,
    String sunEnd2}) {
    bool twoSessions = (monStart2 == "" &&
        tueStart2 == "" &&
        wedStart2 == "" &&
        thuStart2 == "" &&
        friStart2 == "" &&
        satStart2 == "" &&
        sunStart2 == "")
        ? false
        : true;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Table(
          children: [
            TableRow(children: <Widget>[
              Text(
                "Monday",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              Text(
                monStart1 == "" ? "" : ("$monStart1 - $monEnd1"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              twoSessions
                  ? Text(
                monStart2 == "" ? "" : ("$monStart2 - $monEnd2"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              )
                  : SizedBox.shrink(),
            ]),
            TableRow(children: <Widget>[
              Text(
                "Tuesday",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              Text(
                tueStart1 == "" ? "" : ("$tueStart1 - $tueEnd1"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              twoSessions
                  ? Text(
                tueStart2 == "" ? "" : ("$tueStart2 - $tueEnd2"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              )
                  : SizedBox.shrink(),
            ]),
            TableRow(children: <Widget>[
              Text(
                "Wednesday",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              Text(
                wedStart1 == "" ? "" : ("$wedStart1 - $wedEnd1"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              twoSessions
                  ? Text(
                wedStart2 == "" ? "" : ("$wedStart2 - $wedEnd2"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              )
                  : SizedBox.shrink(),
            ]),
            TableRow(children: <Widget>[
              Text(
                "Thursday",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              Text(
                thuStart1 == "" ? "" : ("$thuStart1 - $thuEnd1"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              twoSessions
                  ? Text(
                thuStart2 == "" ? "" : ("$thuStart2 - $thuEnd2"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              )
                  : SizedBox.shrink(),
            ]),
            TableRow(children: <Widget>[
              Text(
                "Friday",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              Text(
                friStart1 == "" ? "" : ("$friStart1 - $friEnd1"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              twoSessions
                  ? Text(
                friStart2 == "" ? "" : ("$friStart2 - $friEnd2"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              )
                  : SizedBox.shrink(),
            ]),
            TableRow(children: <Widget>[
              Text(
                "Saturday",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              Text(
                satStart1 == "" ? "" : ("$satStart1 - $satEnd1"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              twoSessions
                  ? Text(
                satStart2 == "" ? "" : ("$satStart2 - $satEnd2"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              )
                  : SizedBox.shrink(),
            ]),
            TableRow(children: <Widget>[
              Text(
                "Sunday",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              Text(
                sunStart1 == "" ? "" : ("$sunStart1 - $sunEnd1"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              twoSessions
                  ? Text(
                sunStart2 == "" ? "" : ("$sunStart2 - $sunEnd2"),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              )
                  : SizedBox.shrink(),
            ]),
          ],
        ),
      ),
    );
  }

  Widget facilityWidget({int index, String description}) {
    if (index < 0) {
      index = 0;
    }

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              keySymbolList[index].symbolCategory,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ),
          Column(
            children: [
              Text(
                keySymbolList[index].symbolDescription,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                  keySymbolList[index].backgroundIndicator),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                            child: Image(
                              image: AssetImage(keySymbolList[index].symbol),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: description.length > 0
                          ? Text(description,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1)
                          : SizedBox.shrink(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
