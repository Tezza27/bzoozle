import 'Content.dart';
import 'dart:convert';

class Payload {

  String id;
  String title;
  String description;
  String tags;

  List<Content> content = new List();

  Payload(id, title, description, tags) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.tags = tags;
  }

  void addContent(List<Content> content) {
    this.content = content;
  }

  Map toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'tags': tags,
    'content': "TODO: Make the content list work"// generateContentString()
  };

  generateContentString() {
    String contentString = "";
    for (int i = 0; i < content.length; i++){
      contentString += content[i].toJson().toString();
    }
    return contentString;
  }

  static List<Payload> jsonStringToList(String jsonString){
    List<Payload> payloadList = [];
    List<dynamic> dynamicList = json.decode(jsonString);    

    for (int i = 0; i < dynamicList.length; i++){
      Payload newPayload = Payload( // id, title, description, tags
        dynamicList[i]["id"], 
        dynamicList[i]["title"], 
        dynamicList[i]["decription"], 
        dynamicList[i]["tags"]
      );

      payloadList.add(newPayload);
    }

    return payloadList;
  }
}