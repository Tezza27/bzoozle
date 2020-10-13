import 'package:bzoozle/models/key_model.dart';

// This list contains all of the details necessary to construct the buttons on
// the main menu screen
final List<KeySymbolClass> keySymbolList = const <KeySymbolClass>[
  const KeySymbolClass(
      facilityName: "InOut1",
      symbolCategory: "Indoor or Outdoor Venue",
      backgroundIndicator: "assets/green_square.png",
      symbol: "assets/icon_in_out.png",
      symbolDescription: "Indoor AND outdoor areas"),
  const KeySymbolClass(
      facilityName: "InOut2",
      symbolCategory: "Indoor or Outdoor Venue",
      backgroundIndicator: "assets/orange_octagon.png",
      symbol: "assets/icon_in_out.png",
      symbolDescription: "Indoor only venue"),
  const KeySymbolClass(
      facilityName: "InOut3",
      symbolCategory: "Indoor or Outdoor Venue",
      backgroundIndicator: "assets/red_circle.png",
      symbol: "assets/icon_in_out.png",
      symbolDescription: "Outdoor only venue"),
  const KeySymbolClass(
      facilityName: "Views1",
      symbolCategory: "Views & Settings",
      backgroundIndicator: "assets/green_square.png",
      symbol: "assets/icon_views.png",
      symbolDescription: "Excellent views or setting"),
  const KeySymbolClass(
      facilityName: "Views2",
      symbolCategory: "Views & Settings",
      backgroundIndicator: "assets/orange_octagon.png",
      symbol: "assets/icon_views.png",
      symbolDescription: "Average views or setting"),
  const KeySymbolClass(
      facilityName: "Views3",
      symbolCategory: "Views & Settings",
      backgroundIndicator: "assets/red_circle.png",
      symbol: "assets/icon_views.png",
      symbolDescription: "No views or setting of note"),
  const KeySymbolClass(
      facilityName: "Food1",
      symbolCategory: "Food Availability",
      backgroundIndicator: "assets/green_square.png",
      symbol: "assets/icon_food.png",
      symbolDescription: "Food available"),
  const KeySymbolClass(
      facilityName: "Food2",
      symbolCategory: "Food Availability",
      backgroundIndicator: "assets/orange_octagon.png",
      symbol: "assets/icon_food.png",
      symbolDescription: "Restricted food service"),
  const KeySymbolClass(
      facilityName: "Food3",
      symbolCategory: "Food Availability",
      backgroundIndicator: "assets/red_circle.png",
      symbol: "assets/icon_food.png",
      symbolDescription: "No food available"),
  const KeySymbolClass(
      facilityName: "Smoking1",
      symbolCategory: "Smoking Policy",
      backgroundIndicator: "assets/green_square.png",
      symbol: "assets/icon_smoking.png",
      symbolDescription: "Smoking permitted throughout"),
  const KeySymbolClass(
      facilityName: "Smoking2",
      symbolCategory: "Smoking Policy",
      backgroundIndicator: "assets/orange_octagon.png",
      symbol: "assets/icon_smoking.png",
      symbolDescription: "Restricted smoking areas"),
  const KeySymbolClass(
      facilityName: "Smoking3",
      symbolCategory: "Smoking Policy",
      backgroundIndicator: "assets/red_circle.png",
      symbol: "assets/icon_smoking.png",
      symbolDescription: "Smoke free venue"),
  const KeySymbolClass(
      facilityName: "RecMusic1",
      symbolCategory: "Recorded Music",
      backgroundIndicator: "assets/green_square.png",
      symbol: "assets/icon_recorded_music.png",
      symbolDescription: "Recorded music always played"),
  const KeySymbolClass(
      facilityName: "RecMusic2",
      symbolCategory: "Recorded Music",
      backgroundIndicator: "assets/orange_octagon.png",
      symbol: "assets/icon_recorded_music.png",
      symbolDescription: "Recorded music sometimes played"),
  const KeySymbolClass(
      facilityName: "RecMusic3",
      symbolCategory: "Recorded Music",
      backgroundIndicator: "assets/red_circle.png",
      symbol: "assets/icon_recorded_music.png",
      symbolDescription: "No recorded music played"),
  const KeySymbolClass(
      facilityName: "LiveEnt1",
      symbolCategory: "Live Entertainment",
      backgroundIndicator: "assets/green_square.png",
      symbol: "assets/icon_live_ent.png",
      symbolDescription: "Live entertainment daily"),
  const KeySymbolClass(
      facilityName: "LiveEnt2",
      symbolCategory: "Live Entertainment",
      backgroundIndicator: "assets/orange_octagon.png",
      symbol: "assets/icon_live_ent.png",
      symbolDescription: "Live entertainment some days"),
  const KeySymbolClass(
      facilityName: "LiveEnt3",
      symbolCategory: "Live Entertainment",
      backgroundIndicator: "assets/red_circle.png",
      symbol: "assets/icon_live_ent.png",
      symbolDescription: "No live entertainment"),
  const KeySymbolClass(
      facilityName: "CCharge1",
      symbolCategory: "Cover Charge/Entry Fee",
      backgroundIndicator: "assets/green_square.png",
      symbol: "assets/icon_cover.png",
      symbolDescription: "Always free entry"),
  const KeySymbolClass(
      facilityName: "CCharge2",
      symbolCategory: "Cover Charge/Entry Fee",
      backgroundIndicator: "assets/orange_octagon.png",
      symbol: "assets/icon_cover.png",
      symbolDescription: "Sometimes a cover charge/entry fee"),
  const KeySymbolClass(
      facilityName: "CCharge3",
      symbolCategory: "Cover Charge/Entry Fee",
      backgroundIndicator: "assets/red_circle.png",
      symbol: "assets/icon_cover.png",
      symbolDescription: "Always a cover charge/entry fee"),
  const KeySymbolClass(
      facilityName: "DressCode1",
      symbolCategory: "Dress Code",
      backgroundIndicator: "assets/green_square.png",
      symbol: "assets/icon_dresscode.png",
      symbolDescription: "No dress restrictions - anything goes!"),
  const KeySymbolClass(
      facilityName: "DressCode2",
      symbolCategory: "Dress Code",
      backgroundIndicator: "assets/orange_octagon.png",
      symbol: "assets/icon_dresscode.png",
      symbolDescription: "Some dress restrictions"),
  const KeySymbolClass(
      facilityName: "DressCode3",
      symbolCategory: "Dress Code",
      backgroundIndicator: "assets/red_circle.png",
      symbol: "assets/icon_dresscode.png",
      symbolDescription: "Strict dress restrictions"),
  const KeySymbolClass(
      facilityName: "ChildPolicy1",
      symbolCategory: "Child Policy",
      backgroundIndicator: "assets/green_square.png",
      symbol: "assets/icon_child.png",
      symbolDescription: "Families welcome"),
  const KeySymbolClass(
      facilityName: "ChildPolicy2",
      symbolCategory: "Child Policy",
      backgroundIndicator: "assets/orange_octagon.png",
      symbol: "assets/icon_child.png",
      symbolDescription: "Families welcome (restricted times or areas)"),
  const KeySymbolClass(
      facilityName: "ChildPolicy3",
      symbolCategory: "Child Policy",
      backgroundIndicator: "assets/red_circle.png",
      symbol: "assets/icon_child.png",
      symbolDescription: "Adults only"),
  const KeySymbolClass(
      facilityName: "Accessibility1",
      symbolCategory: "Accessibility",
      backgroundIndicator: "assets/green_square.png",
      symbol: "assets/icon_accessibility.png",
      symbolDescription: "Fully accessible for all visitors"),
  const KeySymbolClass(
      facilityName: "Accessibility2",
      symbolCategory: "Accessibility",
      backgroundIndicator: "assets/orange_octagon.png",
      symbol: "assets/icon_accessibility.png",
      symbolDescription:
          "Partially accessible (some visitors could experience difficulty)"),
  const KeySymbolClass(
      facilityName: "Accessibility3",
      symbolCategory: "Accessibility",
      backgroundIndicator: "assets/red_circle.png",
      symbol: "assets/icon_accessibility.png",
      symbolDescription: "Not accessible for visitors with special needs"),
];

List<List<KeySymbolClass>> createListOfLists() {
  List<List<KeySymbolClass>> categoryContentsList =
      List<List<KeySymbolClass>>();
  for (int i = 0; i < keySymbolList.length; i = i + 3) {
    List<KeySymbolClass> subList = [
      keySymbolList[i],
      keySymbolList[i + 1],
      keySymbolList[i + 2]
    ];
    categoryContentsList.add(subList);
  }

  return categoryContentsList;
}
