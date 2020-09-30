import 'package:flutter/material.dart';

import '../lists/venue_list.dart';
import '../settings/myTheme.dart';
import '../templates/listing_card.dart';

/*This is the listings screen
Purpose: To display a scrollable list of cards (using the 'listing_card.dart template)
for each venue in the filtered list, containing high level details to help the user select venues to explore
 further by clicking on a card to take them to the full details for the
 selected venue. A long press on a particular section of the card takes the user
 to the edit screen, enabling them to update that information for that venue.
Input parameters: listingCard objects*/

class ListingsScreen extends StatefulWidget {
//  final String areaTitle;
//
//  const ListingsScreen({Key key, this.areaTitle}) : super(key: key);

  @override
  _ListingsState createState() => new _ListingsState();
}

class _ListingsState extends State<ListingsScreen> {
// StreamSubscription<QuerySnapshot>subscription;
// List<DocumentSnapshot>snapshot;
// CollectionReference collectionReference=Firestore.instance.collection("Venues");

  @override
  void initState() {
    super.initState();
//    subscription=collectionReference.snapshots().listen((datasnapshot){
//      setState(() {
//        snapshot=datasnapshot.documents;
//      });
//      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColour,
        iconTheme: IconThemeData(color: iconColour),
        actions: <Widget>[
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
        title: Text(
          "Area",
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: backgroundColour,
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: listingCardList.length,
              itemBuilder: (context, int index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "VenueDetailsScreen",
                          arguments: listingCardList[index]);
                    },
                    splashColor: secondaryColour,
                    borderRadius: BorderRadius.circular(10.0),
                    child: ListingCard(listingCard: listingCardList[index]));
              }),
        ),
      ),
    );
  }

//  bool listFilter({String venueArea, String areaDiscriminator}) {
//    bool includeItemBool = true;
//    if (areaDiscriminator != "All Las Vegas" &&
//        venueArea != areaDiscriminator) {
//      includeItemBool = false;
//    }
//    return includeItemBool;
//  }
}
