import 'package:flutter/material.dart';
import 'package:bzoozle/settings/dimensions.dart';
import 'package:bzoozle/settings/colours.dart';

class TimeDropdown extends StatefulWidget {
  const TimeDropdown({this.startValue, this.timeList});

  final String startValue;
  final List<String> timeList;

  @override
  _TimeDropdownState createState() => _TimeDropdownState();
}

class _TimeDropdownState extends State<TimeDropdown> {
  String selectedValue;

  @override
  Widget build(BuildContext context) {
    selectedValue = widget.startValue;
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
        value: selectedValue,
        underline: Container(),
        elevation: 10,
        iconSize: 0.00,
        onChanged: (String newValue) {
          setState(() {
            selectedValue = newValue;
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
}}
