import 'package:flutter_cache_manager/flutter_cache_manager.dart';
String store = "https://projectwave.ams3.digitaloceanspaces.com/content/"; // payload1595884879345

class Content {

  String payloadID;
  String name;
  String key;
  String type;

  bool downloaded = false;
  Stream<FileResponse> fileStream;

  Content(id, name, key, type) {
    this.payloadID = id;
    this.name = name;
    this.key = key;
    this.type = type;

    this.saveToLocal();
  }

  saveToLocal() async {
    fileStream = DefaultCacheManager().getFileStream(store + this.key, withProgress: true);
    // fileStream.listen((event) { 
    //   print("BOOP BOOP BOOP");
    // });
  }

  Map toJson() => {
    'payloadID': payloadID,
    'name': name,
    'key': key,
    'type': type
  };

  static void progress () {

  }
}