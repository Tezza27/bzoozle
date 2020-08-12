import 'package:flutter/material.dart';
import 'package:bzoozle/settings/colours.dart';
import 'package:bzoozle/templates/main_menu_button.dart';
import 'package:bzoozle/lists/menu_button_list.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColour,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: menuButtonList
                .map((menuButtonClass) => MainMenuButton(
                      mainMenuButton: menuButtonClass,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}


