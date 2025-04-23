class Commissions {
  int? id;
  String name;
  String explanation;
  String contact;
  String leaders;

  Commissions({
    this.id,
    required this.name,
    required this.explanation,
    required this.contact,
    required this.leaders,
  });
  factory Commissions.fromJson(Map<String, dynamic> json) {
    return Commissions(
      name: json['name'],
      id: json['id'],
      explanation: json['explanation'],
      contact: json['contact'],
      leaders: json['leaders'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'contact': contact,
      'id': id,
      'name': name,
      'explanation': explanation,
      'leaders': leaders,
    };
  }
}
