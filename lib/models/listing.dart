import 'dart:convert';

import 'package:equatable/equatable.dart';

class Listing extends Equatable {
  final String? title;
  final String? description;
  final String? country;
  final String? city;
  final String? image_url;
  const Listing(
      {required this.title,
      required this.description,
      required this.country,
      required this.city,
      required this.image_url});

  @override
  List<Object?> get props => [title, description, country, city, image_url];

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'label2': country,
      'lable1': city,
    };
  }

  factory Listing.fromMap(Map<String, dynamic> map) {
    return Listing(
      title: map['title'],
      description: map['description'],
      country: map['label2'],
      city: map['label1'],
      image_url: map['image_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Listing.fromJson(Map<String, dynamic> source) =>
      Listing.fromMap(source);
}
