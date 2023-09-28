import 'package:listo/app/dependency_inyection/login_inyection/injector_abtract_login_repository.dart';
import 'package:listo/app/dependency_inyection/login_inyection/injector_bloc_login.dart';
import 'package:listo/app/dependency_inyection/modulo_inyection/injector_abtract_modulo_repository.dart';
import 'package:listo/app/dependency_inyection/modulo_inyection/injector_bloc_modulo.dart';

import 'preferences/injector_preferences_bloc.dart';
import 'preferences/injector_abstract_preference_repository.dart';

class InjectorApp {
  void regist() {
    InjectorPreferenceBloc().injectorPreferenceBloc();
    InjectorAbstractPreferenceRepository()
        .injectorAbstractPreferencesRepository();

    InjectorLoginBloc().injectorLoginBloc();
    InjectorAbstracLoginRepository().injectorAbstracLoginRepository();

    InjectorModuloBloc().injectorModuloBloc();
    InjectorAbstracModuloRepository().injectorAbstracModuloRepository();
  }
}
