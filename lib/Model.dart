// To parse this JSON data, do
//
//     final samplePost = samplePostFromJson(jsonString);

import 'dart:convert';

SamplePost samplePostFromJson(String str) =>
    SamplePost.fromJson(json.decode(str));

class SamplePost {
  SamplePost({
    this.sample,
  });

  List<Sample>? sample;

  factory SamplePost.fromJson(Map<String, dynamic> json) => SamplePost(
        sample: json["sample"] == null
            ? null
            : List<Sample>.from(json["sample"].map((x) => Sample.fromJson(x))),
      );
}

class Sample {
  Sample({
    this.location,
    this.image,
    this.bedrooms,
    this.cost,
  });

  String? location;
  String? image;
  String? bedrooms;
  String? cost;

  factory Sample.fromJson(Map<String, dynamic> json) => Sample(
        location: json["location"] == null ? null : json["location"],
        image: json["image"] == null ? null : json["image"],
        bedrooms: json["bedrooms"] == null ? null : json["bedrooms"],
        cost: json["cost"] == null ? null : json["cost"],
      );

  Map<String, dynamic> toJson() => {
        "location": location == null ? null : location,
        "image": image == null ? null : image,
        "bedrooms": bedrooms == null ? null : bedrooms,
        "cost": cost == null ? null : cost,
      };
}
