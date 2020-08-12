import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareBzoozleScreen extends StatefulWidget {
  @override
  _ShareBzoozleScreenState createState() => _ShareBzoozleScreenState();
}

class _ShareBzoozleScreenState extends State<ShareBzoozleScreen> {
  double shapeSize = 20.00;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100.00,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    "assets/red_circle.png",
                  ),
                  height: shapeSize,
                  width: shapeSize,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    "assets/orange_octagon.png",
                  ),
                  height: shapeSize,
                  width: shapeSize,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    "assets/green_square.png",
                  ),
                  height: shapeSize,
                  width: shapeSize,
                ),
              ),
              Text(
                  "This screen will contain the tools to facilitate new user recruitment and sharing the BZOOZLE message on their own social media pages"),
            ],
          ),
        ),
      ),
    );
  }
}
