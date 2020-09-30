import 'package:flutter/material.dart';

import 'package:bzoozle/models/key_model.dart';
import 'package:bzoozle/settings/dimensions.dart';

import 'package:bzoozle/templates/myCard.dart';

class KeyFacilitiesCard extends StatelessWidget {
  const KeyFacilitiesCard({Key key, this.categoryContents}) : super(key: key);
  final List<KeySymbolClass> categoryContents;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardSize / 100 * 70,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: MyCard(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 8.0, right: 8.0),
                child: Text(
                  categoryContents[0].symbolCategory,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                ),
              ),
              rowCard(listIndex: 0, textTheme: Theme
                  .of(context)
                  .textTheme),
              rowCard(listIndex: 1, textTheme: Theme
                  .of(context)
                  .textTheme),
              rowCard(listIndex: 2, textTheme: Theme
                  .of(context)
                  .textTheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowCard({int listIndex, TextTheme textTheme}) {
    return Container(
      child: Padding(
        padding:
        const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0, right: 4.0),
        child: Container(
          height: cardSize / 100 * 12,
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  child: Stack(
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage(
                              categoryContents[listIndex].backgroundIndicator),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image(
                            image:
                            AssetImage(categoryContents[listIndex].symbol),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                    child: Text(
                      categoryContents[listIndex].symbolDescription,
                      style: textTheme.headline1,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

}
