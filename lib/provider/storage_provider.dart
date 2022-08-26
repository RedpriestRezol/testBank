import 'package:kursach/enums/storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class StorageProvider {
  final _storage = FlutterSecureStorage();
  Future<void> write (StorageKeys key, String value) async {
    await _storage.write(key: key.stringValue, value: value);

  }
  Future<String?> read (StorageKeys key) async {
    return  _storage.read(key: key.stringValue);
  }
}