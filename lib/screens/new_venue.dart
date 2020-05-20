import 'package:flutter/material.dart';
import 'package:bzoozle/lists/time_selections.dart';
import 'package:bzoozle/settings/dimensions.dart';
import 'package:bzoozle/settings/colours.dart';

class NewVenueScreen extends StatefulWidget {
  @override
  _NewVenueScreenState createState() => _NewVenueScreenState();
}

class _NewVenueScreenState extends State<NewVenueScreen> {
  String selectedValue;
  String mondayOpen1Hour = "10";
  String mondayClose1Hour = "11";
  String mondayOpen2Hour = "12";
  String mondayClose2Hour = "13";
  String tuesdayOpen1Hour;
  String tuesdayClose1Hour;
  String tuesdayOpen2Hour;
  String tuesdayClose2Hour;
  String wednesdayOpen1Hour;
  String wednesdayClose1Hour;
  String wednesdayOpen2Hour;
  String wednesdayClose2Hour;
  String thursdayOpen1Hour;
  String thursdayClose1Hour;
  String thursdayOpen2Hour;
  String thursdayClose2Hour;
  String fridayOpen1Hour;
  String fridayClose1Hour;
  String fridayOpen2Hour;
  String fridayClose2Hour;
  String saturdayOpen1Hour;
  String saturdayClose1Hour;
  String saturdayOpen2Hour;
  String saturdayClose2Hour;
  String sundayOpen1Hour;
  String sundayClose1Hour;
  String sundayOpen2Hour;
  String sundayClose2Hour;
  String mondayOpen1Minute = "00";
  String mondayClose1Minute = "15";
  String mondayOpen2Minute = "30";
  String mondayClose2Minute = "45";
  String tuesdayOpen1Minute;
  String tuesdayClose1Minute;
  String tuesdayOpen2Minute;
  String tuesdayClose2Minute;
  String wednesdayOpen1Minute;
  String wednesdayClose1Minute;
  String wednesdayOpen2Minute;
  String wednesdayClose2Minute;
  String thursdayOpen1Minute;
  String thursdayClose1Minute;
  String thursdayOpen2Minute;
  String thursdayClose2Minute;
  String fridayOpen1Minute;
  String fridayClose1Minute;
  String fridayOpen2Minute;
  String fridayClose2Minute;
  String saturdayOpen1Minute;
  String saturdayClose1Minute;
  String saturdayOpen2Minute;
  String saturdayClose2Minute;
  String sundayOpen1Minute;
  String sundayClose1Minute;
  String sundayOpen2Minute;
  String sundayClose2Minute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 8.0, right: 8.0),
              child: Row(
                children: <Widget>[
                  Text("MONDAY"),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  timeDropdown(
                      startValue: mondayOpen1Hour, timeList: hoursList),
                  Text(":"),
                  timeDropdown(
                      startValue: mondayOpen1Minute, timeList: minutesList),
                  Text(" - "),
                  timeDropdown(
                      startValue: mondayClose1Hour, timeList: hoursList),
                  Text(":"),
                  timeDropdown(
                      startValue: mondayClose1Minute, timeList: minutesList),
                  Spacer(),
                  timeDropdown(
                      startValue: mondayOpen2Hour, timeList: hoursList),
                  Text(":"),
                  timeDropdown(
                      startValue: mondayOpen2Minute, timeList: minutesList),
                  Text(" - "),
                  timeDropdown(
                      startValue: mondayClose2Hour, timeList: hoursList),
                  Text(":"),
                  timeDropdown(
                      startValue: mondayClose2Minute, timeList: minutesList),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  Container timeDropdown({String startValue, List<String> timeList}) {
    selectedValue = startValue;
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
        items: timeList.map<DropdownMenuItem<String>>((String newValue) {
          return DropdownMenuItem<String>(
            value: newValue,
            child: Text(newValue),
          );
        }).toList(),
      ),
    );
  }
}
