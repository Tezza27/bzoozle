import 'package:bzoozle/lists/key_list.dart';
import 'package:bzoozle/models/key_model.dart';
import 'package:bzoozle/settings/myTheme.dart';
import 'package:bzoozle/templates/key_facilities_card.dart';
import 'package:flutter/material.dart';

class KeyFacilitiesScreen extends StatefulWidget {
  @override
  _KeyFacilitiesScreenState createState() => _KeyFacilitiesScreenState();
}

class _KeyFacilitiesScreenState extends State<KeyFacilitiesScreen> {
  @override
  Widget build(BuildContext context) {
    List<List<KeySymbolClass>> categoryContentsList = createListOfLists();
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: appBarColour,
        iconTheme: IconThemeData(color: iconColour),
        title: Text(
          "Key To Facilities Symbols",
          style: Theme
              .of(context)
              .textTheme
              .headline2,
        ),
        centerTitle: true,
      ),
      body: Container(
        //color: backgroundColour,
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoryContentsList.length,
              itemBuilder: (
                context,
                int index,
              ) {
                return KeyFacilitiesCard(
                    categoryContents: categoryContentsList[index]);
              }),
        ),
      ),
    );
  }

  List<List<KeySymbolClass>> createListOfLists() {
    List<List<KeySymbolClass>> categoryContentsList =
        List<List<KeySymbolClass>>();
    for (int i = 0; i < keySymbolList.length; i = i + 3) {
      List<KeySymbolClass> subList = [
        keySymbolList[i],
        keySymbolList[i + 1],
        keySymbolList[i + 2]
      ];
      categoryContentsList.add(subList);
    }

    return categoryContentsList;
  }
}
