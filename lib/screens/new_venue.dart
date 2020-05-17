import 'package:flutter/material.dart';
import 'package:bzoozle/lists/time_selections.dart';

class NewVenueScreen extends StatefulWidget {
  @override
  _NewVenueScreenState createState() => _NewVenueScreenState();
}

class _NewVenueScreenState extends State<NewVenueScreen> {
  @override
  Widget build(BuildContext context) {
    String mondayOpen1Hour;
    String mondayClose1Hour;
    String mondayOpen2Hour;
    String mondayClose2Hour;
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
    String mondayOpen1Minute;
    String mondayClose1Minute;
    String mondayOpen2Minute;
    String mondayClose2Minute;
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

    return Container(
      child: Center(
          child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              DropdownButton<String>(
                value: mondayOpen1Hour,
                elevation: 10,
                onChanged: (String newValue) {
                  setState(() {
                    mondayOpen1Hour = newValue;
                  });
                },
                items: hoursList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
