import 'package:flutter/material.dart';
import 'package:bzoozle/lists/time_selections.dart';
import 'package:bzoozle/templates/time_dropdown.dart';

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
            child: Padding(
          padding: const EdgeInsets.only(top: 28.0, left: 16.0, right: 16.0),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "MONDAY",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "TUESDAY",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "WEDNESDAY",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "THURSDAY",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "FRIDAY",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "SATURDAY",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "SUNDAY",
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  TimeDropdown(
                      startValue: mondayOpen1Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: tuesdayOpen1Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: wednesdayOpen1Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: thursdayOpen1Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: fridayOpen1Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: saturdayOpen1Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: sundayOpen1Hour, timeList: hoursList),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                ],
              ),
              Column(
                children: <Widget>[
                  TimeDropdown(
                      startValue: mondayOpen1Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: tuesdayOpen1Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: wednesdayOpen1Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: thursdayOpen1Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: fridayOpen1Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: saturdayOpen1Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: sundayOpen1Minute, timeList: minutesList),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(" - "),
                  Text(" - "),
                  Text(" - "),
                  Text(" - "),
                  Text(" - "),
                  Text(" - "),
                  Text(" - "),
                ],
              ),
              Column(
                children: <Widget>[
                  TimeDropdown(
                      startValue: mondayClose1Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: tuesdayClose1Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: wednesdayClose1Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: thursdayClose1Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: fridayClose1Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: saturdayClose1Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: sundayClose1Hour, timeList: hoursList),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                ],
              ),
              Column(
                children: <Widget>[
                  TimeDropdown(
                      startValue: mondayClose1Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: tuesdayClose1Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: wednesdayClose1Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: thursdayClose1Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: fridayClose1Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: saturdayClose1Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: sundayClose1Minute, timeList: minutesList),
                ],
              ),
              Column(
                children: <Widget>[
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                ],
              ),
              Column(
                children: <Widget>[
                  TimeDropdown(
                      startValue: mondayOpen2Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: tuesdayOpen2Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: wednesdayOpen2Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: thursdayOpen2Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: fridayOpen2Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: saturdayOpen2Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: sundayOpen2Hour, timeList: hoursList),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                ],
              ),
              Column(
                children: <Widget>[
                  TimeDropdown(
                      startValue: mondayOpen2Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: tuesdayOpen2Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: wednesdayOpen2Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: thursdayOpen2Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: fridayOpen2Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: saturdayOpen2Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: sundayOpen2Minute, timeList: minutesList),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(" - "),
                  Text(" - "),
                  Text(" - "),
                  Text(" - "),
                  Text(" - "),
                  Text(" - "),
                  Text(" - "),
                ],
              ),
              Column(
                children: <Widget>[
                  TimeDropdown(
                      startValue: mondayClose2Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: tuesdayClose2Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: wednesdayClose2Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: thursdayClose2Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: fridayClose2Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: saturdayClose2Hour, timeList: hoursList),
                  TimeDropdown(
                      startValue: sundayClose2Hour, timeList: hoursList),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                ],
              ),
              Column(
                children: <Widget>[
                  TimeDropdown(
                      startValue: mondayClose2Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: tuesdayClose2Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: wednesdayClose2Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: thursdayClose2Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: fridayClose2Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: saturdayClose2Minute, timeList: minutesList),
                  TimeDropdown(
                      startValue: sundayClose2Minute, timeList: minutesList),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
