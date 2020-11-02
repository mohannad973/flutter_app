
import 'dart:convert';

CoursesResponse coursesResponseFromJson(String str) => CoursesResponse.fromJson(json.decode(str));

String coursesResponseToJson(CoursesResponse data) => json.encode(data.toJson());

class CoursesResponse {
  CoursesResponse({
    this.courses,
  });

  List<Course> courses;



  factory CoursesResponse.fromJson(Map<String, dynamic> json) => CoursesResponse(
    courses: List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
  };
}

class Course {
  Course({
    this.id,
    this.videoUrl,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String videoUrl;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    videoUrl: json["video_url"],
    title: json["title"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "video_url": videoUrl,
    "title": title,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
