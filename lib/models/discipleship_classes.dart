class DiscipleshipClass {
  int? id;
  String level;
  String title;
  String teacher;
  String program;
  String contact;
  String news;

  DiscipleshipClass({
    this.id,
    required this.level,
    required this.teacher,
    required this.contact,
    required this.program,
    required this.news,
    required this.title,
  });
  factory DiscipleshipClass.fromJson(Map<String, dynamic> json) {
    return DiscipleshipClass(
      level: json['level'],
      id: json['id'],
      teacher: json['teacher'],
      contact: json['contact'],
      program: json['program'],
      news: json['news'],
      title: json['title'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'contact': contact,
      'id': id,
      'teacher': teacher,
      'program': program,
      'news': news,
      'level': level,
      'title': title,
    };
  }
}
