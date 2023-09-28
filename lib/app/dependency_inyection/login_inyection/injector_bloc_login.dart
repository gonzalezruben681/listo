/// Import Libraries
import 'package:injector/injector.dart';

/// Import Blocs
import 'package:listo/app/domain/blocs/login/login_bloc.dart';

/// Import Abstracts
import 'package:listo/app/domain/repositories/login_repository/abstract_login_repository.dart';
import 'package:listo/app/domain/repositories/preferences_repository/abstract_preferences_repository.dart';

class InjectorLoginBloc {
  void injectorLoginBloc() {
    final injector = Injector.appInstance;
    injector.registerSingleton<LoginBloc>(() {
      return LoginBloc(
          abstractLoginRepository: injector.get<AbstractLoginRepository>(),
          preferencesRepository: injector.get<AbstractPreferencesRepository>());
    });
  }
}
