import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winston/utils/ExperienceLoader.dart';
import 'package:winston/models/Experience.dart';
import 'package:winston/models/Beacon.dart';
import 'package:winston/models/Payload.dart';

class ExperienceController extends ChangeNotifier {

  static final ExperienceController _instance = ExperienceController._internal();
  static final String server = "http://167.172.54.123/api/public/";
  
  Experience currentExperience = Experience("", "", "", "");

  factory ExperienceController() {
    return _instance;
  }
  
  ExperienceController._internal();

  isExperienceAvailable(String id) async {
    // attempt to pull experience from local storage
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove(id);
    String experience = localStorage.getString(id);
    return experience;
  }

  beginExperienceDownload(String id) async {
    print("DOWNLOAD: " + id);
    // TODO: Check that the download was a success before moving on. 
    // fetch the experience from the server
    ExperienceLoader experienceLoader = ExperienceLoader();
    await experienceLoader.fetch(server + id);
    
    List<String> info = experienceLoader.getInfo();
    
    // create a new Experience based on the data from the server
    currentExperience = Experience(info[0], info[1], info[2], info[3]);
    currentExperience.setBeacons(experienceLoader.getBeacons());
    currentExperience.setPayloads(experienceLoader.getPayloads());

    saveExperienceToLocalStorage(currentExperience);
    notifyListeners();
  }

  static saveExperienceToLocalStorage (Experience experience) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    
    print("----------- SAVE -----------");
    Map<dynamic, dynamic> experienceMap = experience.toJson();

    String experienceString = json.encode(experienceMap);

    localStorage.setString(experience.id, experienceString);
  }

  loadExperienceFromLocalStorage(String id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    String experienceString = localStorage.getString(id);
    Map experienceMap = json.decode(experienceString);

    currentExperience = Experience(
      experienceMap["id"],
      experienceMap["name"],
      experienceMap["description"],
      experienceMap["variables"]
    );
    
    Beacon.jsonStringToList(experienceMap["beacons"]);
    Payload.jsonStringToList(experienceMap["payloads"]);

    notifyListeners();
  }
}