import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_book/entities/backpack_book.dart';
import 'package:my_book/entities/city.dart';
import 'package:my_book/entities/school.dart';
import 'package:my_book/entities/search_book.dart';
import 'package:http/http.dart' as http;
import 'package:my_book/entities/user_details.dart';

import '../../entities/user.dart';
import '../../helper_entities/exceptions.dart';

class ApiClient {
  static const _baseUrl = 'https://mybook.dniprorada.gov.ua/api/';
  static const _baseAvatarUrl = 'https://mybook.dniprorada.gov.ua';
  static const _booksUrl = 'books/get/';
  static const _citiesUrl = 'cities/get';
  static const _authLoginUrl = 'auth/login';
  static const _authMeUrl = 'auth/me';
  static const _registerUrl = 'auth/register';
  static const _getAllUrl = 'auth/getall';
  static const _extracurricalBook = 'books/get/13';
  static const _backpackUrl = 'backpacks/getallbooks/';
  static const _backpackAddBookUrl = 'backpacks/add';
  static const _backpackRemoveBookUrl = 'backpacks/removebook';
  static const _changePasswordUrl = 'auth/changepass';
  static const _resetPasswordUrl = 'auth/resetpassword';
  static const _updateUserUrl = 'auth/update';
  static const _getAllCommonSchoolsUrl = 'school/get/1';
  static const _getAllMusicalSchoolsUrl = 'extracurricularInstitution/get/1';
  static const _uploadImageUrl = 'upload';
  static const _changeAvatarUrl = 'auth/changeavatar';
  static const _classBackpackUrl = 'library/get';
  static const _musicClassBackpackUrl =
      'extracurricularBook/getExtracurricularAllSchoolLibraryBooks/';

  static Future<List<SearchBook>> getBooks(int userClass) async {
    final tempResponse = (await Dio().get(
      _baseUrl + _booksUrl + userClass.toString(),
    ))
        .data as List<dynamic>;
    final booksList = tempResponse
        .map((e) => SearchBook.fromJSON(e as Map<String, dynamic>))
        .toList();
    // print(booksList);
    return booksList;
  }

  static Future<List<SearchBook>> getExtracurricalBooks(int userClass) async {
    final tempResponse = (await Dio().get(
      _baseUrl + _extracurricalBook,
    ))
        .data as List<dynamic>;
    print(tempResponse);
    final booksList = tempResponse
        .map((e) => SearchBook.fromJSON(e as Map<String, dynamic>))
        .toList();
    print(booksList);
    return booksList;
  }

  static Future<User> authLogin(String login, String password) async {
    final headers = {
      'login': login,
      'password': password,
    };

    final response = await Dio().post(
      _baseUrl + _authLoginUrl,
      data: headers,
    );

    print(response);
    return User.fromJson(response.data['user']);
  }

  static Future<UserDetails> authMe(String? token) async {
    final headers = {
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      Uri.parse(_baseUrl + _authMeUrl),
      headers: headers,
    );

    if (response.body == '{"message":"Доступ обмежено"}') {
      throw Exception();
    }

    print(response.body);
    return UserDetails.fromJson(
      jsonDecode(response.body),
    );
  }

  static Future<User> register(
      String login, String password, String fullName, int cityId) async {
    final body = {
      'fullName': fullName,
      'password': password,
      'login': login,
      'city': cityId,
    };
    final response = await Dio().post(
      _baseUrl + _registerUrl,
      data: body,
    );

    print(response);

    return User.fromJson(response.data['user']);
  }

  static Future<UserDetails> update({
    required String fullName,
    required int id,
    required String login,
    required String? mail,
    required String? commonSchool,
    String? musicalSchool,
    required String? schoolClass,
    required String city,
    required String token,
  }) async {
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final body = {
      'extracurricularInstitution1': musicalSchool,
      'fullName': fullName,
      'id': id,
      'login': login,
      'mail': mail,
      'school': commonSchool,
      'schoolClass': schoolClass,
      'sity': city,
    };
    final response = await http.post(
      Uri.parse(_baseUrl + _updateUserUrl),
      body: jsonEncode(body),
      headers: headers,
    );

    if (jsonDecode(response.body)['errno'] == null) {
      return UserDetails.fromJson(
          jsonDecode(response.body)['user'] as Map<String, dynamic>);
    } else {
      final sqlErrorCode = jsonDecode(response.body)['sqlMessage'];
      if (sqlErrorCode.contains('login')) {
        throw MyBookLoginDuplicatedException();
      } else {
        throw MyBookMailDuplicatedException();
      }
    }
  }

  static Future getAllUsers() async {
    final response = await Dio().get(_baseUrl + _getAllUrl);
    print(response);
    return response;
  }

  static Future<String> uploadImage(String imagePath) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(_baseUrl + _uploadImageUrl));

    request.files.add(
      http.MultipartFile.fromBytes('image', File(imagePath).readAsBytesSync(),
          filename: imagePath.split("/").last),
    );

    final tempResponse = await request.send();
    final avatarUrl =
        jsonDecode(await tempResponse.stream.bytesToString())['url'];

    return avatarUrl;
  }

  static Future changeAvatar({
    required String avatarUrl,
    required String token,
    required int id,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final body = {
      'avatarURL': _baseAvatarUrl + avatarUrl,
      'id': id,
    };

    await http.post(
      Uri.parse(_baseUrl + _changeAvatarUrl),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  static Future<List<City>> getCities() async {
    final response = await Dio().get(_baseUrl + _citiesUrl);
    return (response.data as List<dynamic>)
        .map((e) => City.fromJSON(e as Map<String, dynamic>))
        .toList();
  }

  static Future<List<School>> getCommonSchools() async {
    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await Dio().get(
      _baseUrl + _getAllCommonSchoolsUrl,
      queryParameters: headers,
    );

    final schools = [School(name: 'Школа не обрана')];

    final tempSchools = (response.data as List<dynamic>)
        .map((e) => School.fromJSON(e as Map<String, dynamic>))
        .toList();

    schools.addAll(tempSchools);

    return schools;
  }

  static Future<List<School>> getMusicalSchools() async {
    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await Dio().get(
      _baseUrl + _getAllMusicalSchoolsUrl,
      queryParameters: headers,
    );

    final schools = [School(name: 'Школа не обрана')];

    final tempSchools = (response.data as List<dynamic>)
        .map((e) => School.fromJSON(e as Map<String, dynamic>))
        .toList();

    schools.addAll(tempSchools);

    return schools;
  }

  static Future<List<BackpackBook>> getUserBackpack(
      int backpackId, String token) async {
    dynamic response;
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    try {
      response = await http.get(
        Uri.parse(_baseUrl + _backpackUrl + backpackId.toString()),
        headers: headers,
      );
    } catch (e) {
      print(e);
    }

    if (response.body == '{"message":"Доступ обмежено"}') {
      throw Exception();
    }

    final decodedRepsonse = jsonDecode(response.body) as List<dynamic>;

    final backpack = decodedRepsonse
        .map(
            (element) => BackpackBook.fromJson(element as Map<String, dynamic>))
        .toList();

    print(backpack);

    return backpack;
  }

  static Future<List<BackpackBook>?> getClassBackpack(
    int? classId,
    String? schoolName,
    String token,
  ) async {
    if (classId == null || schoolName == null) {
      return null;
    } else {
      dynamic response;

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final body = {
        'classID': classId,
        'schoolID': schoolName,
      };

      try {
        response = await http.post(
          Uri.parse(_baseUrl + _classBackpackUrl),
          headers: headers,
          body: jsonEncode(body),
        );
      } catch (e) {
        print(e);
      }

      if (response.body == '{"message":"Доступ обмежено"}') {
        throw Exception();
      }

      final decodedRepsonse = jsonDecode(response.body) as List<dynamic>;

      final backpack = decodedRepsonse
          .map((element) =>
              BackpackBook.fromJson(element as Map<String, dynamic>))
          .toList();

      print(backpack);

      return backpack;
    }
  }

  static Future<List<BackpackBook>?> getMusicClassBackpack(
    String? schoolName,
    String token,
  ) async {
    if (schoolName == null) {
      return null;
    } else {
      dynamic response;

      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      try {
        response = await http.get(
          Uri.parse(_baseUrl + _musicClassBackpackUrl + schoolName),
          headers: headers,
        );
      } catch (e) {
        print(e);
      }

      if (response.body == '{"message":"Доступ обмежено"}') {
        throw Exception();
      }

      final decodedRepsonse = jsonDecode(response.body) as List<dynamic>;

      final backpack = decodedRepsonse
          .map((element) =>
              BackpackBook.fromJson(element as Map<String, dynamic>))
          .toList();

      print(backpack);

      return backpack;
    }
  }

  static Future addBookToBackpack(Map<String, int?> data, String token) async {
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final body = json.encode(data);

    final response = await http.post(
      Uri.parse(_baseUrl + _backpackAddBookUrl),
      body: body,
      headers: headers,
    );

    print(jsonDecode(response.body));
  }

  static Future<void> removeBookFromBackpack(
      Map<String, int?> data, String token) async {
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final body = json.encode(data);

    final response = await http.post(
      Uri.parse(_baseUrl + _backpackRemoveBookUrl),
      body: body,
      headers: headers,
    );

    print(jsonDecode(response.body));
  }

  static Future<String> changePassword(
      int id, String currentPassword, String newPassword, String token) async {
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final data = {
      'id': id,
      'password': currentPassword,
      'newPassword': newPassword,
    };

    final body = json.encode(data);

    final response = await http.post(
      Uri.parse(_baseUrl + _changePasswordUrl),
      body: body,
      headers: headers,
    );

    return response.body;
  }

  static Future<String> resetPassword(String mail) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    final data = {
      'mail': mail,
    };

    final body = json.encode(data);

    final response = await http.post(
      Uri.parse(_baseUrl + _resetPasswordUrl),
      body: body,
      headers: headers,
    );

    return response.body;
  }

  static Future<List<int>> downloadBook(String bookUrl) async {
    final response = await Dio().get(
      bookUrl,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return response.data;
  }
}
