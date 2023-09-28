/// Import Injectors
import 'package:injector/injector.dart';

/// Import Blocs
import 'package:listo/app/domain/blocs/modulo/modulo_bloc.dart';

import 'package:listo/app/domain/repositories/modulo_repository/abstract_modulo_repository.dart';
import 'package:listo/app/domain/repositories/preferences_repository/abstract_preferences_repository.dart';

class InjectorModuloBloc {
  void injectorModuloBloc() {
    final injector = Injector.appInstance;
    injector.registerSingleton<ModuloBloc>(() {
      return ModuloBloc(
          abstractModuloRepository: injector.get<AbstractModuloRepository>(),
          preferencesRepository: injector.get<AbstractPreferencesRepository>());
    });
  }
}
