import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  final String id;
  final String title;
  final String description;
  final Timestamp createdAt;
  final String picture;
  final String doctorName;
  final String category;
  final bool isSaved;
  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.picture,
    required this.category,
    required this.doctorName,
    required this.isSaved,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json, String id) {
    return NewsModel(
      id: id,
      isSaved: json['isSaved'],
      doctorName: json['docktor_name'],
      title: json['title'],
      description: json['description'],
      createdAt: json['createdAt'],
      picture: json['picture'],
      category: json['category'],
    );
  }
}
