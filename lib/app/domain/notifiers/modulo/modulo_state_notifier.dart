/// Import flutter
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listo/app/data/repository_impl/modulo_repository_impl/modulo_repository_impl.dart';

/// Import Paquetes Relativos

/// Import Entities
import 'package:listo/app/domain/entities/utils/error_dto.dart';
import 'package:listo/app/domain/entities/login_dto/permisos_dto.dart';
import 'package:listo/app/domain/notifiers/login/login_state_notifier.dart';

/// Import Abstract
import 'package:listo/app/domain/repositories/modulo_repository/abstract_modulo_repository.dart';
import 'package:listo/app/domain/repositories/preferences_repository/abstract_preferences_repository.dart';

/// Import Utils
import 'package:listo/app/data/utils/error_general.dart';
import 'package:listo/app/data/utils/custom_exception.dart';
import 'package:listo/app/data/utils/constantes_shared_preferences.dart';

part 'modulo_state.dart';

// injeccion
final moduloStateNotifierProvider =
    StateNotifierProvider<ModuloStateNotifier, ModuloState>(
        (ref) => ModuloStateNotifier(ref));

//Provider
final abstractModuloProvider =
    Provider<AbstractModuloRepository>((ref) => ModuloRepositoryImpl());

class ModuloStateNotifier extends StateNotifier<ModuloState> {
  final AbstractModuloRepository _abstractModuloRepository;
  final AbstractPreferencesRepository _preferencesRepository;

  ModuloStateNotifier(ProviderReference ref)
      : _preferencesRepository = ref.read(abstractPreferencesProvider),
        _abstractModuloRepository = ref.read(abstractModuloProvider),
        super(ModuloInitial());
        

  void consultarPermisos() async {
    try {
      state = CargandoModuloState();
      final listaPermisos = await _abstractModuloRepository.consultarPermisos();

      await _preferencesRepository.save(
          ConstantesSharedPreferences.permisos, listaPermisos);

      state = ListaPermisosState(listaPermisos, 0);
    } on FetchDataException catch (e) {
      state = ErrorModuloState(e.error);
    } catch (_) {
      state = ErrorModuloState(ErrorGeneral().errorNoControlado());
    }
  }

  void consultarPermisosLocal() async {
    try {
      state = CargandoModuloState();
      final permisos = await _preferencesRepository
          .read(ConstantesSharedPreferences.permisos);

      PermisosDTO permisosDTO = PermisosDTO.fromJson(permisos);

      int cantidadModulosHome = 0;
      permisosDTO.toJson().forEach((key, value) {
        if (key == 'clientes' ||
            key == 'venta' ||
            key == 'recaudo' ||
            key == 'recargas' ||
            key == 'rifas' ||
            key == 'tienda') {
          value as List<dynamic>;
          if (value.isNotEmpty) {
            cantidadModulosHome++;
          }
        }
      });

      state = ListaPermisosState(permisosDTO, cantidadModulosHome);
    } on FetchDataException catch (e) {
      state = ErrorModuloState(e.error);
    } catch (_) {
      state = ErrorModuloState(ErrorGeneral().errorNoControlado());
    }
  }
}
