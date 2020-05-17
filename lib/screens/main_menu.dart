import 'package:flutter/material.dart';
import 'package:bzoozle/models/main_menu_button.dart';
import 'package:bzoozle/settings/colours.dart';
import 'package:bzoozle/templates/main_menu_button.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<MenuButtonClass> menuButtonList = const <MenuButtonClass>[
      const MenuButtonClass(
          buttonText: "Venues",
          routerName: "ListingsScreen",
          buttonImage: null),
      const MenuButtonClass(
          buttonText: "Add Venue",
          routerName: "NewVenueScreen",
          buttonImage: null),
      const MenuButtonClass(
          buttonText: "My Account",
          routerName: "ListingsScreen",
          buttonImage: null),
      const MenuButtonClass(
          buttonText: "My Trips",
          routerName: "ListingsScreen",
          buttonImage: null),
      const MenuButtonClass(
          buttonText: "Share BZOOZLE",
          routerName: "ListingsScreen",
          buttonImage: null),
      const MenuButtonClass(
          buttonText: "Talk to BZOOZLE",
          routerName: "ListingsScreen",
          buttonImage: null),
    ];
    return Scaffold(
        body: Container(
      color: backgroundColour,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: OrientationBuilder(builder: (context, orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              children: List.generate(
                menuButtonList.length,
                (index) {
                  return Center(
                    child:
                        MainMenuButton(mainMenuButton: menuButtonList[index]),
                  );
                },
              ),
            );
          }),
        ),
      ),
    ));
  }
}
