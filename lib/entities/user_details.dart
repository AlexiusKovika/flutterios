class UserDetails {
  String? token;
  String? fullName;
  String? extracurricularInstitution1;
  String? login;
  String? role;
  String? mail;
  String? schoolClass;
  String? regDate;
  String? avatarURL;
  String? name;
  String? cityName;
  int? backpackId;
  int? userId;

  UserDetails({
    this.userId,
    this.token,
    this.fullName,
    this.extracurricularInstitution1,
    this.login,
    this.role,
    this.mail,
    this.schoolClass,
    this.regDate,
    this.avatarURL,
    this.name,
    this.cityName,
    this.backpackId,
  });

  UserDetails.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    extracurricularInstitution1 = json['extracurricularInstitution1'];
    login = json['login'];
    role = json['role'];
    mail = json['mail'];
    schoolClass = json['schoolClass'];
    regDate = json['regDate'];
    avatarURL = json['avatarURL'];
    name = json['name'];
    cityName = json['CityName'];
    backpackId = json['backpackId'];
    userId = json['userID'];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fullName'] = fullName;
    data['extracurricularInstitution1'] = extracurricularInstitution1;
    data['login'] = login;
    data['role'] = role;
    data['mail'] = mail;
    data['schoolClass'] = schoolClass;
    data['regDate'] = regDate;
    data['avatarURL'] = avatarURL;
    data['name'] = name;
    data['CityName'] = cityName;
    data['backpackId'] = backpackId;
    data['userID'] = userId;
    return data;
  }
}
