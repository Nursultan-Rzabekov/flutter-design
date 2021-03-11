import 'package:flutter/foundation.dart';

class BeerModel {
  int id;
  String name;
  String tagline;
  String description;
  String imageUrl;

  BeerModel({
    @required this.id,
    @required this.name,
    @required this.tagline,
    @required this.description,
    @required this.imageUrl,
  });

  BeerModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        tagline = json['tagline'],
        description = json['description'],
        imageUrl = json['image_url'];
}
