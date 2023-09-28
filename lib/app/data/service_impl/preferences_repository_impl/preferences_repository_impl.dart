/// Import Flutter
import 'dart:convert';

/// Import Libraries
import 'package:shared_preferences/shared_preferences.dart';

/// Import Abstracts
import 'package:listo/app/domain/services/preferences_repository/abstract_preferences_repository.dart';

class PreferencesRepositoryImpl extends AbstractPreferencesRepository {
  @override
  Future<Map<String, dynamic>> read(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString(key) != null) {
      return json.decode(sharedPreferences.getString(key)!);
    }

    return {};
  }

  @override
  Future<void> save({required String key, required dynamic value}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, json.encode(value));
  }

  @override
  Future<void> remove(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }
}
