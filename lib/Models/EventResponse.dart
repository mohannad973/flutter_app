import 'dart:convert';

EventsResponse eventsResponseFromJson(String str) => EventsResponse.fromJson(json.decode(str));

String eventsResponseToJson(EventsResponse data) => json.encode(data.toJson());

class EventsResponse {
  EventsResponse({
    this.events,
  });

  List<Event> events;

  factory EventsResponse.fromJson(Map<String, dynamic> json) => EventsResponse(
    events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
  };
}

class Event {
  Event({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String description;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    imageUrl: json["image_url"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image_url": imageUrl,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
