
import 'package:flutter/material.dart';
import 'package:winston/utils/ExperienceMenuItem.dart';
import 'package:winston/controllers/ExperienceController.dart';

class ExperienceTile extends StatefulWidget{

  ExperienceMenuItem experienceMenuItem;
  ExperienceTile(this.experienceMenuItem);

  @override
  _ExperienceTileState createState() => _ExperienceTileState();
}

class _ExperienceTileState extends State<ExperienceTile>{
  
  bool downloaded = false;
  ExperienceController experienceController = ExperienceController();
  //Builds and returns a 'download or launch' button depending on the 'downloaded' bool
  getButton(){
    if(!downloaded){
      return FlatButton(
        onPressed: buttonPress,
        shape: 
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.black)
          ),
        child: 
          Text('Download',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          )
      );
    }
    else{
      return 
      Padding(
        padding: EdgeInsets.only(right: 9),
        child:
          FlatButton(
          onPressed: buttonPress,
          color: Colors.lightGreen,
          shape: 
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          child: 
            Text('Launch',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            )
        )
      );
      
    }
  }

  //This is just a test to change the button state
  void buttonPress(){
    // Check whether the id is a key in the local storage
    experienceController.isExperienceAvailable(widget.experienceMenuItem.id)
      .then((result) => {
        if (result != null) launchExperience() else downloadExperience()
      })
      .catchError(print);

    // 
    setState(() {
      downloaded = !downloaded;
    });
  }

  void downloadExperience () {
    experienceController.beginExperienceDownload(widget.experienceMenuItem.id);
  }

  void launchExperience () {
    experienceController.loadExperienceFromLocalStorage(widget.experienceMenuItem.id);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(top:12, right: 14, bottom:12, left:14),
      decoration: BoxDecoration(
        border: Border(
          //top: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
          bottom: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
        ), 
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child:
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: 
                  Text(widget.experienceMenuItem.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                  )
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: 
                  Text(widget.experienceMenuItem.beacons.length.toString() + ' locations',
                  style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 100, 100, 100),
                  fontSize: 16),
                  )
                ),
            ],
          ),
          ),
          //gets a different button depending on download status
          getButton() 
          ] 
        )

    );


  }


}