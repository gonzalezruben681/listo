abstract class AbstractPreferencesRepository {
  Future<Map<String, dynamic>> read(String key);

  Future<void> save(String key, dynamic value);

  Future<void> remove(String key);
}
