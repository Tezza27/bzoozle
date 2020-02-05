import 'package:flutter/material.dart';
import 'screens/listings.dart';
import 'settings/colours.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 9,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColour,
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: tabSelectionColour,
              labelColor: tabSelectionColour,
              unselectedLabelColor: tabUnselectedColour,
              tabs: [
                Tab(text: "All"),
                Tab(text: "St"),
                Tab(text: "DT"),
                Tab(text: "AD"),
                Tab(text: "TS"),
                Tab(text: "N"),
                Tab(text: "E"),
                Tab(text: "S"),
                Tab(text: "W"),
              ],
            ),
            title: Center(
                child: Text(
              "BZOOZLE",
              style: TextStyle(color: textHeaderColour),
              textAlign: TextAlign.center,
            )),
          ),
          body: TabBarView(
            children: [
              ListingsScreen(areaTitle: "All Las Vegas"),
              ListingsScreen(areaTitle: "The Strip"),
              ListingsScreen(areaTitle: "Downtown"),
              ListingsScreen(areaTitle: "The Arts District"),
              ListingsScreen(areaTitle: "Town Square"),
              ListingsScreen(areaTitle: "North of Strip"),
              ListingsScreen(areaTitle: "East of Strip"),
              ListingsScreen(areaTitle: "South of Strip"),
              ListingsScreen(areaTitle: "West of Strip"),
            ],
          ),
        ),
      ),
      theme: ThemeData(
//        primarySwatch: Colors.black,
          ),
    );
  }
}
