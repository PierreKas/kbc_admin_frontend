class Announcement {
  int? id;
  String message;
  DateTime time;
  String title;
  String? type;

  Announcement({
    this.id,
    required this.message,
    required this.time,
    required this.title,
    this.type,
  });
  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
        message: json['message'],
        id: json['id'],
        time: json['time'] is String
            ? DateTime.parse(json['time'])
            : json['time'],
        title: json['title'],
        type: json['type']);
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'id': id,
      'time': time.toIso8601String(),
      'title': title,
      'type': type,
    };
  }
}
