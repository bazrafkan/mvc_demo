import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;

  Photo({this.id, this.title, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }

  static List<Photo> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  static Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/photos');
    return compute(parsePhotos, response.body);
  }
}
