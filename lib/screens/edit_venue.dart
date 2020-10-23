import 'dart:io';

import 'package:bzoozle/lists/key_list.dart';
import 'package:bzoozle/lists/venue_edit_headers.dart';
import 'package:bzoozle/models/venue_header_model.dart';
import 'package:bzoozle/models/venue_model.dart';
import 'package:bzoozle/settings/myTheme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditVenueScreen extends StatefulWidget {
  @override
  _EditVenueScreenState createState() => _EditVenueScreenState();
}

class _EditVenueScreenState extends State<EditVenueScreen> {
  String chosenValue;

  @override
  Widget build(BuildContext context) {
    final VenueClass venueDetails =
        ModalRoute.of(context).settings.arguments as VenueClass;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: iconColour),
        title: Text(
          "EDIT - ${venueDetails.venueName}",
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColour,
      body: Container(
        color: backgroundColour,
        child: ListView(
          children: <Widget>[
            Container(
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    venueHeaderList[index].isExpanded =
                        !venueHeaderList[index].isExpanded;
                  });
                },
                children: venueHeaderList.map(
                  (VenueHeaderClass item) {
                    return ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, bottom: 2.0),
                                  child: Text(
                                    item.buttonText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                                Text(
                                  "Validated: ${item.lastUpdateDate} ${item.lastUpdateTime} By: ${item.lastUpdateName}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      isExpanded: item.isExpanded,
                      body: Container(
                        child: expansionContent(
                            containerType: item.buttonText,
                            venueDetails: venueDetails,
                            textTheme: Theme.of(context).textTheme),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, bottom: 0.0, left: 100.0, right: 100.0),
              child: SizedBox(
                width: 80.0,
                child: RaisedButton(
                  child: Text("Save Changes"),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget expansionContent(
      {String containerType, VenueClass venueDetails, TextTheme textTheme}) {
    Widget contentContainer;
    switch (containerType) {
      case "Photograph":
        {
          contentContainer = photographContainer(
              venueDetails: venueDetails, textTheme: textTheme);
        }
        break;
      case "Directions":
        {
          contentContainer = directionsContainer(
              venueDetails: venueDetails, textTheme: textTheme);
        }
        break;
      case "What To Expect":
        {
          contentContainer = whatToExpectContainer(venueDetails: venueDetails);
        }
        break;
      // case "Opening Times":
      //   {
      //     contentContainer = openingTimesContainer(
      //         venueDetails: venueDetails, textTheme: textTheme);
      //   }
      //   break;
      // case "Happy Hours":
      //   {
      //     contentContainer = happyHoursContainer(
      //         venueDetails: venueDetails, textTheme: textTheme);
      //   }
      //   break;
      case "Photograph":
        {
          contentContainer = photographContainer();
        }
        break;
      case "Facilities & Policies":
        {
          contentContainer = facilitiesAndPoliciesContainer(
              venueDetails: venueDetails, textTheme: textTheme);
        }
        break;
    }
    return contentContainer;
  }

  Widget photographContainer({VenueClass venueDetails, TextTheme textTheme}) {
    File imageFile;
    return Container(
      color: backgroundColour,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: Text(
                "Do you have a better picture than this to show off ${venueDetails.venueName}? \n Please upload it, or, if you are currently at ${venueDetails.venueName}, please take a great photo. \nLandscape works best.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: imageFile != null
                      ? Image.file(
                          imageFile,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height / 4,
                          width: double.infinity,
                        )
                      : Image.asset(
                          venueDetails.venueImage,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height / 4,
                          width: double.infinity,
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: secondaryColour,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          )),
                      child: IconButton(
                          color: secondaryColour,
                          icon: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              color: primaryColour,
                              size: 30.0,
                            ),
                          ),
                          onPressed: () => _getPicture(
                              imageFile: imageFile, cameraSource: false)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: secondaryColour,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          )),
                      child: IconButton(
                          icon: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.camera_enhance,
                              color: primaryColour,
                              size: 30.0,
                            ),
                          ),
                          onPressed: () => _getPicture(
                              imageFile: imageFile, cameraSource: true)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
              child: myButton(buttonText: "Cancel", onPressedFunction: null),
            ),
            IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: secondaryColour,
                ),
                onPressed: null),
          ],
        ),
      ),
    );
  }

  _getPicture({File imageFile, bool cameraSource}) async {
    final _picker = ImagePicker();
    final PickedFile pickedFile = await _picker.getImage(
      source: cameraSource ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    final File file = File(pickedFile.path);
    if (pickedFile != null) {
      setState(() {
        imageFile = file;
      });
    }
  }

  Widget directionsContainer({VenueClass venueDetails, TextTheme textTheme}) {
    TextEditingController _controller = TextEditingController()
      ..text = venueDetails.venueDirections;
    return Container(
      color: backgroundColour,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: Text(
                "Can you help Bzoozlers to find ${venueDetails.venueName} more easily? \n Perhaps provide a few simple directions from a well known or very easy to find nearby landmark.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            TextField(
              controller: _controller,
              autocorrect: true,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              maxLength: 300,
              minLines: 5,
              maxLines: null,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                filled: true,
                fillColor: textInputColour,
                labelText: "Directions",
                labelStyle: Theme.of(context).textTheme.bodyText1,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: secondaryColour, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: secondaryColour, width: 2.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
              child: myButton(buttonText: "Cancel", onPressedFunction: null),
            ),
            IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: secondaryColour,
                ),
                onPressed: null)
          ],
        ),
      ),
    );
  }

  Widget whatToExpectContainer({VenueClass venueDetails, TextTheme textTheme}) {
    TextEditingController _controllerReason1 = TextEditingController()
      ..text = venueDetails.venueGoodForTitle1;
    TextEditingController _controllerDescription1 = TextEditingController()
      ..text = venueDetails.venueGoodForDescription1;
    TextEditingController _controllerReason2 = TextEditingController()
      ..text = venueDetails.venueGoodForTitle2;
    TextEditingController _controllerDescription2 = TextEditingController()
      ..text = venueDetails.venueGoodForDescription2;
    TextEditingController _controllerReason3 = TextEditingController()
      ..text = venueDetails.venueGoodForTitle3;
    TextEditingController _controllerDescription3 = TextEditingController()
      ..text = venueDetails.venueGoodForDescription3;
    TextEditingController _controllerReason4 = TextEditingController()
      ..text = venueDetails.venueGoodForTitle4;
    TextEditingController _controllerDescription4 = TextEditingController()
      ..text = venueDetails.venueGoodForDescription4;
    TextEditingController _controllerReason5 = TextEditingController()
      ..text = venueDetails.venueGoodForTitle5;
    TextEditingController _controllerDescription5 = TextEditingController()
      ..text = venueDetails.venueGoodForDescription5;
    TextEditingController _controllerReason6 = TextEditingController()
      ..text = venueDetails.venueGoodForTitle6;
    TextEditingController _controllerDescription6 = TextEditingController()
      ..text = venueDetails.venueGoodForDescription6;
    TextEditingController _controllerLongDescription = TextEditingController()
      ..text = venueDetails.venueDescription;

    return Container(
      color: backgroundColour,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: Text(
                "Can you help Bzoozlers decide whether ${venueDetails.venueName}, is where they want to be? \n What are the 6 biggest reasons to go there and provide a little more information on them.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            goodForReasonInputField(
                labelText: "Reason 1",
                controller: _controllerReason1,
                textTheme: textTheme),
            goodForDescriptionInputField(
                labelText: "Description 1",
                controller: _controllerDescription1,
                textTheme: textTheme),
            goodForReasonInputField(
                labelText: "Reason 2",
                controller: _controllerReason2,
                textTheme: textTheme),
            goodForDescriptionInputField(
                labelText: "Description 2",
                controller: _controllerDescription2,
                textTheme: textTheme),
            goodForReasonInputField(
                labelText: "Reason 3",
                controller: _controllerReason3,
                textTheme: textTheme),
            goodForDescriptionInputField(
                labelText: "Description 3",
                controller: _controllerDescription3,
                textTheme: textTheme),
            goodForReasonInputField(
                labelText: "Reason 4",
                controller: _controllerReason4,
                textTheme: textTheme),
            goodForDescriptionInputField(
                labelText: "Description 4",
                controller: _controllerDescription4,
                textTheme: textTheme),
            goodForReasonInputField(
                labelText: "Reason 5",
                controller: _controllerReason5,
                textTheme: textTheme),
            goodForDescriptionInputField(
                labelText: "Description 5",
                controller: _controllerDescription5,
                textTheme: textTheme),
            goodForReasonInputField(
                labelText: "Reason 6",
                controller: _controllerReason6,
                textTheme: textTheme),
            goodForDescriptionInputField(
                labelText: "Description 6",
                controller: _controllerDescription6,
                textTheme: textTheme),
            TextField(
              controller: _controllerLongDescription,
              autocorrect: true,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              minLines: 5,
              maxLines: null,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                labelText: "Full Description",
                labelStyle: Theme.of(context).textTheme.bodyText1,
                filled: true,
                fillColor: textInputColour,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: secondaryColour, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: secondaryColour, width: 2.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
              child: myButton(buttonText: "Cancel", onPressedFunction: null),
            ),
            IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: secondaryColour,
                ),
                onPressed: null),
          ],
        ),
      ),
    );
  }

  Widget goodForReasonInputField(
      {String labelText,
      TextEditingController controller,
      TextTheme textTheme}) {
    return TextField(
      controller: controller,
      autocorrect: true,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      maxLength: 28,
      maxLines: 1,
      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.headline4,
        filled: true,
        fillColor: textInputColour,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: secondaryColour, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: secondaryColour, width: 2.0),
        ),
      ),
    );
  }

  Widget goodForDescriptionInputField(
      {String labelText,
      TextEditingController controller,
      TextTheme textTheme}) {
    return TextField(
      controller: controller,
      autocorrect: true,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      maxLength: 300,
      minLines: 5,
      maxLines: null,
      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.headline4,
        filled: true,
        fillColor: textInputColour,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: secondaryColour, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: secondaryColour, width: 2.0),
        ),
      ),
    );
  }

  Widget openingTimesContainer({VenueClass venueDetails, TextTheme textTheme}) {
    return Container(
      color: backgroundColour,
      child: Column(
        children: <Widget>[
          Text("Coming Soon"),
          timesTable(),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
            child: myButton(buttonText: "Cancel", onPressedFunction: null),
          ),
        ],
      ),
    );
  }

  Widget happyHoursContainer({VenueClass venueDetails, TextTheme textTheme}) {
    return Container(
      color: backgroundColour,
      child: Column(
        children: <Widget>[
          Text("Coming Soon"),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
            child: myButton(buttonText: "Cancel", onPressedFunction: null),
          ),
        ],
      ),
    );
  }

  Widget timesTable({VenueClass venueDetails, TextTheme textTheme}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Table(
          children: [
            TableRow(children: <Widget>[
              Text(
                "Monday",
                style: Theme.of(context).textTheme.headline4,
              ),
              sessionButton(
                  buttonText: venueDetails.venueOpenMonday1 == ""
                      ? "Closed"
                      : "${venueDetails.venueOpenMonday1}-${venueDetails.venueCloseMonday1}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
              sessionButton(
                  buttonText: venueDetails.venueOpenMonday2 == ""
                      ? ""
                      : "${venueDetails.venueOpenMonday2}-${venueDetails.venueCloseMonday2}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
            ]),
            TableRow(children: <Widget>[
              Text(
                "Tuesday",
                style: Theme.of(context).textTheme.headline4,
              ),
              sessionButton(
                  buttonText: venueDetails.venueOpenTuesday1 == ""
                      ? "Closed"
                      : "${venueDetails.venueOpenTuesday1}-${venueDetails.venueCloseTuesday1}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
              sessionButton(
                  buttonText: venueDetails.venueOpenTuesday2 == ""
                      ? ""
                      : "${venueDetails.venueOpenTuesday2}-${venueDetails.venueCloseTuesday2}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
            ]),
            TableRow(children: <Widget>[
              Text(
                "Wednesday",
                style: Theme.of(context).textTheme.headline4,
              ),
              sessionButton(
                  buttonText: venueDetails.venueOpenWednesday1 == ""
                      ? "Closed"
                      : "${venueDetails.venueOpenWednesday1}-${venueDetails.venueCloseWednesday1}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
              sessionButton(
                  buttonText: venueDetails.venueOpenWednesday2 == ""
                      ? ""
                      : "${venueDetails.venueOpenWednesday2}-${venueDetails.venueCloseWednesday2}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
            ]),
            TableRow(children: <Widget>[
              Text(
                "Thursday",
                style: Theme.of(context).textTheme.headline4,
              ),
              sessionButton(
                  buttonText: venueDetails.venueOpenThursday1 == ""
                      ? "Closed"
                      : "${venueDetails.venueOpenThursday1}-${venueDetails.venueCloseThursday1}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
              sessionButton(
                  buttonText: venueDetails.venueOpenThursday2 == ""
                      ? ""
                      : "${venueDetails.venueOpenThursday2}-${venueDetails.venueCloseThursday2}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
            ]),
            TableRow(children: <Widget>[
              Text(
                "Friday",
                style: Theme.of(context).textTheme.headline4,
              ),
              sessionButton(
                  buttonText: venueDetails.venueOpenFriday1 == ""
                      ? "Closed"
                      : "${venueDetails.venueOpenFriday1}-${venueDetails.venueCloseFriday1}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
              sessionButton(
                  buttonText: venueDetails.venueOpenFriday2 == ""
                      ? ""
                      : "${venueDetails.venueOpenFriday2}-${venueDetails.venueCloseFriday2}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
            ]),
            TableRow(children: <Widget>[
              Text(
                "Saturday",
                style: Theme.of(context).textTheme.headline4,
              ),
              sessionButton(
                  buttonText: venueDetails.venueOpenSaturday1 == ""
                      ? "Closed"
                      : "${venueDetails.venueOpenSaturday1}-${venueDetails.venueCloseSaturday1}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
              sessionButton(
                  buttonText: venueDetails.venueOpenSaturday2 == ""
                      ? ""
                      : "${venueDetails.venueOpenSaturday2}-${venueDetails.venueCloseSaturday2}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
            ]),
            TableRow(children: <Widget>[
              Text(
                "Sunday",
                style: Theme.of(context).textTheme.headline4,
              ),
              sessionButton(
                  buttonText: venueDetails.venueOpenSunday1 == ""
                      ? "Closed"
                      : "${venueDetails.venueOpenSunday1}-${venueDetails.venueCloseSunday1}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
              sessionButton(
                  buttonText: venueDetails.venueOpenSunday2 == ""
                      ? ""
                      : "${venueDetails.venueOpenSunday2}-${venueDetails.venueCloseSunday2}",
                  editState: false,
                  textTheme: Theme.of(context).textTheme),
            ]),
          ],
        ),
      ),
    );
  }

  Widget sessionButton(
      {String buttonText, bool editState, TextTheme textTheme}) {
    return SizedBox.expand(
      child: FlatButton(
        child: editState
            ? Text(buttonText,
                style: textTheme.bodyText1.copyWith(color: primaryColour))
            : Text(
                "Editing",
                style: textTheme.bodyText1,
              ),
        color: editState ? backgroundColour : secondaryColour,
        splashColor: editState ? secondaryColour : backgroundColour,
        onPressed: () {
          setState(() {
            editState ? editState = false : editState = true;
            //sessionButtonState(buttonText: buttonText, editState: editState);
          });
        },
      ),
    );
  }

  void sessionButtonState(
      {String buttonText, bool editState, TextTheme textTheme}) {}

  Widget facilitiesAndPoliciesContainer(
      {VenueClass venueDetails, TextTheme textTheme}) {
    TextEditingController _controllerInOut = TextEditingController()
      ..text = venueDetails.venueInOutNote;
    TextEditingController _controllerViews = TextEditingController()
      ..text = venueDetails.venueViewsNote;
    TextEditingController _controllerFood = TextEditingController()
      ..text = venueDetails.venueFoodNote;
    TextEditingController _controllerSmoking = TextEditingController()
      ..text = venueDetails.venueSmokingNote;
    TextEditingController _controllerRecMusic = TextEditingController()
      ..text = venueDetails.venueRecMusicNote;
    TextEditingController _controllerLiveEnt = TextEditingController()
      ..text = venueDetails.venueLiveEntNote;
    TextEditingController _controllerCCharge = TextEditingController()
      ..text = venueDetails.venueCChargeNote;
    TextEditingController _controllerDressCode = TextEditingController()
      ..text = venueDetails.venueDressCodeNote;
    TextEditingController _controllerChildPolicy = TextEditingController()
      ..text = venueDetails.venueChildPolicyNote;
    TextEditingController _controllerAccessibility = TextEditingController()
      ..text = venueDetails.venueAccessibilityNote;
    return Container(
      color: backgroundColour,
      child: Column(
        children: <Widget>[
          Text("Coming Soon"),
          facilityWidget(
              ind: 0,
              indicator: venueDetails.venueInOut,
              controller: _controllerInOut,
              labelText: venueDetails.venueInOutNote,
              categoryText: keySymbolList[0].symbolCategory,
              textTheme: textTheme),
          facilityWidget(
              ind: 3,
              indicator: venueDetails.venueViews,
              controller: _controllerViews,
              labelText: venueDetails.venueViewsNote,
              categoryText: keySymbolList[3].symbolCategory,
              textTheme: textTheme),
          facilityWidget(
              ind: 6,
              indicator: venueDetails.venueFood,
              controller: _controllerFood,
              labelText: venueDetails.venueFoodNote,
              categoryText: keySymbolList[6].symbolCategory,
              textTheme: textTheme),
          facilityWidget(
              ind: 9,
              indicator: venueDetails.venueSmoking,
              controller: _controllerSmoking,
              labelText: venueDetails.venueSmokingNote,
              categoryText: keySymbolList[9].symbolCategory,
              textTheme: textTheme),
          facilityWidget(
              ind: 12,
              indicator: venueDetails.venueRecMusic,
              controller: _controllerRecMusic,
              labelText: venueDetails.venueRecMusicNote,
              categoryText: keySymbolList[12].symbolCategory,
              textTheme: textTheme),
          facilityWidget(
              ind: 15,
              indicator: venueDetails.venueLiveEnt,
              controller: _controllerLiveEnt,
              labelText: venueDetails.venueLiveEntNote,
              categoryText: keySymbolList[15].symbolCategory,
              textTheme: textTheme),
          facilityWidget(
              ind: 18,
              indicator: venueDetails.venueCCharge,
              controller: _controllerCCharge,
              labelText: venueDetails.venueCChargeNote,
              categoryText: keySymbolList[18].symbolCategory,
              textTheme: textTheme),
          facilityWidget(
              ind: 21,
              indicator: venueDetails.venueDressCode,
              controller: _controllerDressCode,
              labelText: venueDetails.venueDressCodeNote,
              categoryText: keySymbolList[21].symbolCategory,
              textTheme: textTheme),
          facilityWidget(
              ind: 24,
              indicator: venueDetails.venueChildPolicy,
              controller: _controllerChildPolicy,
              labelText: venueDetails.venueChildPolicyNote,
              categoryText: keySymbolList[24].symbolCategory,
              textTheme: textTheme),
          facilityWidget(
              ind: 27,
              indicator: venueDetails.venueAccessibility,
              controller: _controllerAccessibility,
              labelText: venueDetails.venueAccessibilityNote,
              categoryText: keySymbolList[27].symbolCategory,
              textTheme: textTheme),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
            child: myButton(buttonText: "Cancel", onPressedFunction: null),
          ),
        ],
      ),
    );
  }

  Widget facilityWidget(
      {int ind,
      String indicator,
      TextEditingController controller,
      String labelText,
      String categoryText,
      TextTheme textTheme}) {
    List<String> menuList = List<String>();
    for (int i = ind; i < ind + 3; i++) {
      menuList.add(keySymbolList[i].symbolDescription);

      print(menuList);
    }
    chosenValue = menuList[int.parse(indicator) - 1];
    int symbolIndex = keySymbolList.indexWhere((item) =>
        item.symbolDescription.toLowerCase() == chosenValue.toLowerCase());
    return Padding(
      padding:
          const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 8.0, right: 8.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 0.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 8.0),
                child: Text(
                  categoryText,
                  style: textTheme.headline4,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      child: Stack(
                        children: [
                          Center(
                            child: Image(
                              image: AssetImage(keySymbolList[symbolIndex]
                                  .backgroundIndicator),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image(
                                image: AssetImage(
                                    keySymbolList[symbolIndex].symbol),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: textInputColour,
                        border: Border.all(
                            color: secondaryColour,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 0.0),
                        child: DropdownButton<String>(
                          value: chosenValue,
                          dropdownColor: textInputColour,
                          underline: Container(),
                          elevation: 10,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          iconSize: 0.00,
                          onChanged: (String newValue) {
                            setState(() {
                              chosenValue = newValue;
                            });
                          },
                          items: menuList
                              .map<DropdownMenuItem<String>>((String newValue) {
                            return DropdownMenuItem<String>(
                              value: newValue,
                              child: Text(newValue),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 0.0),
              child: TextField(
                controller: controller,
                autocorrect: true,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                maxLength: 300,
                minLines: 5,
                maxLines: null,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  labelText: categoryText,
                  labelStyle: Theme.of(context).textTheme.headline4,
                  filled: true,
                  fillColor: textInputColour,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: secondaryColour, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: secondaryColour, width: 2.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myButton({String buttonText, Function onPressedFunction}) {
    return SizedBox(
      width: 100.0,
      child: RaisedButton(
        child: Text(buttonText),
        onPressed: () {
          //onPressedFunction;
        },
      ),
    );
  }
}
