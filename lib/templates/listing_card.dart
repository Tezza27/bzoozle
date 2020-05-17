//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import '../models/listing_card_model.dart';
//import '../settings/colours.dart';
//
//class ListingCard extends StatelessWidget {
//  const ListingCard({Key key, this.listingCard}) : super(key: key);
//  final ListingCardClass listingCard;
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(10.0),
//          side: BorderSide(color: borderColour, width: 1.0)),
//      color: Colors.white,
//      elevation: 16.0,
//      borderOnForeground: true,
//      child: Row(
//        mainAxisSize: MainAxisSize.max,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: <Widget>[
//          Flexible(
//            flex: 4,
//            child: Stack(
//              children: <Widget>[
//                ClipRRect(
//                  borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(10.0),
//                      bottomLeft: Radius.circular(10.0)),
//                  child: Image(
//                    image: AssetImage(listingCard.venueImage),
//                    fit: BoxFit.cover,
//                    width: double.infinity,
//                  ),
//                ),
//                Positioned(
//                  bottom: 00.00,
//                  child: Container(
////                    width: double.infinity,
//                    height: 60.00,
//                    alignment: Alignment.bottomCenter,
//                    decoration: BoxDecoration(
//                      borderRadius:
//                          BorderRadius.only(bottomLeft: Radius.circular(10.0)),
//                      gradient: LinearGradient(
//                          begin: Alignment.bottomCenter,
//                          end: Alignment.topCenter,
//                          colors: [fadeColour, transparentColour]),
//                    ),
//                    child: Padding(
//                      padding: const EdgeInsets.only(
//                          top: 8.0, bottom: 2.0, left: 8.0, right: 8.0),
//                      child: Text(
//                        "${listingCard.venueName} - ${listingCard.venueLocation}",
//                        textAlign: TextAlign.left,
//                        style: TextStyle(
//                            color: textColour,
//                            fontSize: 16,
//                            fontWeight: FontWeight.bold),
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Flexible(
//            flex: 1,
//            child: Column(
//              mainAxisSize: MainAxisSize.max,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Text(
//                  "Open",
//                  textAlign: TextAlign.center,
//                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
//                ),
//                Text(
//                  listingCard.venueOpenTime,
//                  textAlign: TextAlign.center,
//                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                ),
//                Text(
//                  "Closed",
//                  textAlign: TextAlign.center,
//                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
//                ),
//                Text(
//                  listingCard.venueCloseTime,
//                  textAlign: TextAlign.center,
//                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                ),
//                Text(
//                  "HH Start",
//                  textAlign: TextAlign.center,
//                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
//                ),
//                Text(
//                  listingCard.venueHHStart,
//                  textAlign: TextAlign.center,
//                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                ),
//                Text(
//                  "HH Ends",
//                  textAlign: TextAlign.center,
//                  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
//                ),
//                Text(
//                  listingCard.venueHHEnd,
//                  textAlign: TextAlign.center,
//                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
