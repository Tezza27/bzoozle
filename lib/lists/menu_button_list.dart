import 'package:bzoozle/models/main_menu_button.dart';

// This list contains all of the details necessary to construct the buttons on
// the main menu screen
final List<MenuButtonClass> menuButtonList = const <MenuButtonClass>[
  const MenuButtonClass(
      buttonText: "Venues", routerName: "ListingsScreen", buttonImage: null),
  const MenuButtonClass(
      buttonText: "Edit Venue",
      routerName: "EditVenueScreen",
      buttonImage: null),
  const MenuButtonClass(
      buttonText: "My Account", routerName: "AccountScreen", buttonImage: null),
  const MenuButtonClass(
      buttonText: "Share BZOOZLE",
      routerName: "ShareScreen",
      buttonImage: null),
  const MenuButtonClass(
      buttonText: "Talk to BZOOZLE",
      routerName: "TalkToUsScreen",
      buttonImage: null),
];
