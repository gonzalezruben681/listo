/// Import Libraries
import 'package:injector/injector.dart';

/// Import Implements
import 'package:listo/app/data/repository_impl/preferences_repository_impl/preferences_repository_impl.dart';

/// Import Abstracts
import 'package:listo/app/domain/repositories/preferences_repository/abstract_preferences_repository.dart';

class InjectorAbstractPreferenceRepository {
  void injectorAbstractPreferencesRepository() {
    final injector = Injector.appInstance;
    injector.registerSingleton<AbstractPreferencesRepository>(() {
      return PreferencesRepositoryImpl();
    });
  }
}
