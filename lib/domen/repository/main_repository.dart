import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';

class MainRepository {
  static const _tokenKey = 'tokenKey';
  FlutterSecureStorage? _storage;

  static final MainRepository _instance = MainRepository._internal();

  factory MainRepository() {
    return _instance;
  }

  MainRepository._internal() {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    _storage = FlutterSecureStorage(aOptions: getAndroidOptions());
  }

  Future<String?> readtoken() async {
    final token = await _storage?.read(key: _tokenKey);
    return token;
  }

  Future<void> writetoken(String token) async {
    await _storage?.write(key: _tokenKey, value: token);
  }

  Future<void> rewritetoken(String token) async {
    await _storage?.delete(key: _tokenKey);
    await _storage?.write(key: _tokenKey, value: token);
  }

  Future<void> deletetoken(String token) async {
    await _storage?.delete(key: _tokenKey);
  }

  Future<Directory?> getDownloadDirectory() async {
    Directory? downloadDirectory;

    if (Platform.isIOS) {
      downloadDirectory = await getApplicationDocumentsDirectory();
    } else if (Platform.isAndroid) {
      downloadDirectory = Directory('/storage/emulated/0/Download');

      if (!await downloadDirectory.exists())
        downloadDirectory = await getExternalStorageDirectory();
    }
    return downloadDirectory;
  }

  Future<void> saveDownloadedBook(
      Directory downloadDirectory, List<int> data, String bookName) async {
    var file = File('${downloadDirectory.path}/$bookName.pdf')
        .openSync(mode: FileMode.write);
    await file.writeFrom(data);
    await file.close();
  }
}
