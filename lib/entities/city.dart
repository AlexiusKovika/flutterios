class City {
  int? id;
  String? cityName;

  City.fromJSON(Map<String, dynamic> json) {
    id = json['id'] as int;
    cityName = json['CityName'] as String;
  }
}
