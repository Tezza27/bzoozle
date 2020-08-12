import 'package:flutter/material.dart';
import '../lists/venue_list.dart';
import '../templates/listing_card.dart';
import '../settings/colours.dart';

class ListingsScreen extends StatefulWidget {
  final String areaTitle;

  const ListingsScreen({Key key, this.areaTitle}) : super(key: key);

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
        body: Container(
      color: backgroundColour,
      child: Column(
        children: <Widget>[
          Text(
            widget.areaTitle.toUpperCase(),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textHeaderColour),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listingCardList.length,
                  itemBuilder: (context, int index) {
                    if (listFilter(
                        venueArea: listingCardList[index].venueArea,
                        areaDiscriminator: widget.areaTitle)) {
                      return InkWell(
                          onTap: () {},
                          child:
                              ListingCard(listingCard: listingCardList[index]));
                    } else {
                      return Container();
                    }
                  }),
            ),
          ),
        ],
      ),
    ));
  }

  bool listFilter({String venueArea, String areaDiscriminator}) {
    bool includeItemBool = true;
    if (areaDiscriminator != "All Las Vegas" &&
        venueArea != areaDiscriminator) {
      includeItemBool = false;
    }
    return includeItemBool;
  }
}
