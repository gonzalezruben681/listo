/// Import Injectors
import 'package:injector/injector.dart';

import 'package:listo/app/data/repository_impl/login_repository_impl/login_repository_impl.dart';
import 'package:listo/app/domain/repositories/login_repository/abstract_login_repository.dart';

class InjectorAbstracLoginRepository {
  void injectorAbstracLoginRepository() {
    final injector = Injector.appInstance;

    injector.registerDependency<AbstractLoginRepository>(() {
      return LoginRepositoryImpl();
    });
  }
}
