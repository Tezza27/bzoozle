import 'package:flutter/material.dart';
import '../lists/venue_list.dart';
import '../templates/listing_card.dart';
import '../settings/colours.dart';

class ListingsScreen extends StatefulWidget {

  @override
  _ListingsState createState() => new _ListingsState();
}

class _ListingsState extends State<ListingsScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: backgroundColour,
      child: Column(
        children: <Widget>[
//          Text(
//            "Area Title",
//            style: TextStyle(
//                fontSize: 20,
//                fontWeight: FontWeight.bold,
//                color: textHeaderColour),
//          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listingCardList.length,
                  itemBuilder: (context, int index) {
                    return InkWell(
                        onTap: () {},
                        child:
                            ListingCard(listingCard: listingCardList[index]));
                  }),
            ),
          ),
        ],
      ),
    ));
  }


}
