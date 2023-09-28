/// Import Libraries
import 'package:injector/injector.dart';

/// Import Entities
import 'package:listo/app/domain/entities/configuracion_dto/configuracion_dto.dart';

/// Import Blocs
import 'package:listo/app/domain/blocs/configuracion/configuracion_bloc.dart';

/// Import Abstracts
import 'package:listo/app/domain/repositories/preferences_repository/abstract_preferences_repository.dart';

class InjectorPreferenceBloc {
  void injectorPreferenceBloc() {
    final injector = Injector.appInstance;
    injector.registerSingleton<ConfiguracionBloc>(() {
      return ConfiguracionBloc(
        initialLocale: ConfiguracionDTO(
          idioma: 'es',
        ),
        preferencesRepository: injector.get<AbstractPreferencesRepository>(),
      );
    });
  }
}
