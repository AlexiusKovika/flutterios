class User {
  String? token;
  int? id;
  String? fullName;
  String? login;
  String? cityName;
  int? cityId;
  String? role;
  String? mail;
  String? school;
  String? extracurricularInstitution1;
  String? userClass;
  String? regDate;

  User();

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    fullName = json['fullName'];
    login = json['login'];
    cityName = json['CityName'];
    cityId = json['CityId'];
    role = json['role'];
    mail = json['mail'];
    school = json['school'];
    extracurricularInstitution1 = json['extracurricularInstitution1'];
    userClass = json['class'];
    regDate = json['regDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = token;
    data['id'] = id;
    data['fullName'] = fullName;
    data['login'] = login;
    data['CityName'] = cityName;
    data['CityId'] = cityId;
    data['role'] = role;
    data['mail'] = mail;
    data['school'] = school;
    data['extracurricularInstitution1'] = extracurricularInstitution1;
    data['class'] = userClass;
    data['regDate'] = regDate;
    return data;
  }
}
