import 'package:bzoozle/models/testWord.dart';
import 'package:bzoozle/services/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bzoozle/settings/myTheme.dart';

class FirestoreTestScreen extends StatefulWidget {
  @override
  _FirestoreTestScreenState createState() => _FirestoreTestScreenState();
}

class _FirestoreTestScreenState extends State<FirestoreTestScreen> {
  double shapeSize = 20.00;
  TextEditingController controller = TextEditingController();
  // Create a form with a single text input
  // add button that has the word "save"
  // onclick - send the word to firebase
  // preview the word in firebase to check it is there

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Firestore Test",
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColour,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextField(
                    controller: controller,
                    autocorrect: true,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    maxLength: 28,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      labelText: "Enter word to test",
                      labelStyle: Theme.of(context).textTheme.headline4,
                      filled: true,
                      fillColor: textInputColour,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: secondaryColour, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: secondaryColour, width: 2.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RaisedButton(
                    child: Text("Save this Word"),
                    onPressed: () async {
                      try {
                        await FirestoreService().addWord(TestWord(
                            word: controller.text, creator: "Bzoozle"));
                        setState(() {
                          controller.clear();
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
