import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Importing FlutterSecureStorage for secure local storage

/// A class for managing local storage using FlutterSecureStorage.
class LocalStorage {
  /// Instance of FlutterSecureStorage for secure local storage.
  final storage = const FlutterSecureStorage();

  /// Sets a key-value pair in the local storage.
  ///
  /// Returns a Future<bool> indicating the success of the operation.
  Future<bool> setValue(String key, bool isFav) async {
    await storage.write(key: key, value: jsonEncode(isFav));
    return true;
  }

  /// Reads the value associated with the given key from the local storage.
  ///
  /// Returns a Future<dynamic> representing the value stored for the key.
  Future<bool> readValue(String key) async {
    var data = await storage.read(key: key);
    return jsonDecode(data ?? 'false') as bool;
  }

  /// Clears the value associated with the given key from the local storage.
  ///
  /// Returns a Future<bool> indicating the success of the operation.
  Future<bool> clearValue(String key) async {
    await storage.delete(key: key);
    return true;
  }

  /// Sets the selected app language in the local storage.
  ///
  /// Returns a Future<bool> indicating the success of the operation.
  Future<bool> setLanguage(String languageCode) async {
    await storage.write(key: 'languageCode', value: languageCode);
    return true;
  }

  /// Reads the selected app language from the local storage.
  ///
  /// Returns a Future<String?> representing the language code stored.
  Future<String> readLanguage() async {
    return await storage.read(key: 'languageCode') ?? 'en';
  }
}
