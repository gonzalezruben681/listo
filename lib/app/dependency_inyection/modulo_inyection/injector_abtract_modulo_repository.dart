/// Import Injectors
import 'package:injector/injector.dart';

import 'package:listo/app/data/repository_impl/modulo_repository_impl/modulo_repository_impl.dart';
import 'package:listo/app/domain/repositories/modulo_repository/abstract_modulo_repository.dart';

class InjectorAbstracModuloRepository {
  void injectorAbstracModuloRepository() {
    final injector = Injector.appInstance;

    injector.registerDependency<AbstractModuloRepository>(() {
      return ModuloRepositoryImpl();
    });
  }
}
