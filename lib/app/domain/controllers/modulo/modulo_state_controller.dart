/// Import libraries
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Import Entities
import 'package:listo/app/domain/entities/utils/error_dto.dart';
import 'package:listo/app/domain/entities/login_dto/permisos_dto.dart';

/// Import Providers
import 'package:listo/app/providers/providers.dart';

/// Import Abstract
import 'package:listo/app/domain/repositories/login_repository/abstract_login_repository.dart';
import 'package:listo/app/domain/services/preferences_repository/abstract_preferences_repository.dart';

/// Import Utils
import 'package:listo/app/data/utils/error_general.dart';
import 'package:listo/app/data/utils/custom_exception.dart';
import 'package:listo/app/data/utils/constantes_shared_preferences.dart';

part 'modulo_state.dart';

class ModuloStateNotifier extends StateNotifier<ModuloState> {
  final AbstractLoginRepository _abstractLoginRepository;
  final AbstractPreferencesRepository _preferencesRepository;
  final secureStorage = FlutterSecureStorage();

  ModuloStateNotifier(ProviderReference ref)
      : _preferencesRepository = ref.read(abstractPreferencesProvider),
        _abstractLoginRepository = ref.read(abstractLoginProvider),
        super(ModuloInitial());

  void consultarPermisos() async {
    try {
      state = CargandoModuloState();

      final String codigoUsuario =
          await secureStorage.read(key: 'codigoUsuario') ?? "";

      final listaPermisos =
          await _abstractLoginRepository.consultarPermisos(codigoUsuario);

      await _preferencesRepository.save(
          key: ConstantesSharedPreferences.permisos, value: listaPermisos);

      int cantidadModulosHome = cantidadPermisos(listaPermisos);

      state = ListaPermisosState(listaPermisos, cantidadModulosHome);
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

      int cantidadModulosHome = cantidadPermisos(permisosDTO);

      state = ListaPermisosState(permisosDTO, cantidadModulosHome);
    } on FetchDataException catch (e) {
      state = ErrorModuloState(e.error);
    } catch (_) {
      state = ErrorModuloState(ErrorGeneral().errorNoControlado());
    }
  }

  cantidadPermisos(PermisosDTO permisosDTO) {
    try {
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

      return cantidadModulosHome;
    } catch (_) {
      state = ErrorModuloState(ErrorGeneral().errorNoControlado());
    }
  }
}
