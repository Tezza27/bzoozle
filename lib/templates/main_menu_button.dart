import 'package:bzoozle/models/main_menu_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMenuButton extends StatelessWidget {
  const MainMenuButton({Key key, this.mainMenuButton}) : super(key: key);
  final MenuButtonClass mainMenuButton;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, mainMenuButton.routerName);
        },
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Text(
          mainMenuButton.buttonText,
          textAlign: TextAlign.center,
        ));
  }
}
