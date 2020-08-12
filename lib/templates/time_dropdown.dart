import 'package:flutter/material.dart';
import 'package:bzoozle/settings/dimensions.dart';
import 'package:bzoozle/settings/colours.dart';

class TimeDropdown extends StatefulWidget {
  const TimeDropdown({this.startValue, this.timeList});

  final String startValue;
  final List<String> timeList;

  @override
  _TimeDropdownState createState() => _TimeDropdownState(startValue);
}

class _TimeDropdownState extends State<TimeDropdown> {
  _TimeDropdownState(this.startValue);

  String startValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: timeDropdownHeight,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.0, style: BorderStyle.solid, color: borderColour),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      child: DropdownButton<String>(
        value: startValue,
        underline: Container(),
        elevation: 10,
        iconSize: 0.00,
        onChanged: (String newValue) {
          setState(() {
            startValue = newValue;
          });
        },
        items: widget.timeList.map<DropdownMenuItem<String>>((String newValue) {
          return DropdownMenuItem<String>(
            value: newValue,
            child: Text(newValue),
          );
        }).toList(),
      ),
    );
  }
}
