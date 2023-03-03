class School {
  String? name;

  School({required this.name});

  School.fromJSON(Map<String, dynamic> json) {
    this.name = json['name'] as String;
  }
}
