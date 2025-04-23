class KingdomHome {
  int? id;
  String name;
  String address;
  String contact;
  String host;
  String leader;

  KingdomHome({
    this.id,
    required this.name,
    required this.address,
    required this.contact,
    required this.host,
    required this.leader,
  });
  factory KingdomHome.fromJson(Map<String, dynamic> json) {
    return KingdomHome(
      name: json['name'],
      id: json['id'],
      address: json['address'],
      contact: json['contact'],
      host: json['host'],
      leader: json['leader'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'contact': contact,
      'id': id,
      'name': name,
      'address': address,
      'host': host,
      'leader': leader,
    };
  }
}
