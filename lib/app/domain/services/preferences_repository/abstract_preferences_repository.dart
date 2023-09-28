abstract class AbstractPreferencesRepository {
  Future<Map<String, dynamic>> read(String key);

  Future<void> save({required String key, required dynamic value});

  Future<void> remove(String key);
}
