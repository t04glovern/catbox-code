import 'dart:convert';
import 'package:catbox/models/cat.dart';

class CatApi {

  static List<Cat> allCatsFromJson(String jsonData) {
    return json
        .decode(jsonData)['cats']
        .map((obj) => _fromMap(obj))
        .toList();
  }

  static Cat _fromMap(Map<String, dynamic> map) {
    return new Cat(
      externalId: map['id'],
      name: map['name'],
      description: map['description'],
      avatarUrl: map['image_url'],
      location: map['location'],
      likeCounter: map['like_counter'],
      isAdopted: map['adopted'],
      pictures: new List<String>.from(map['pictures']),
      cattributes: new List<String>.from(map['cattributes']),
    );
  }
}
