/// Import flutter
import 'dart:async';

/// Import Paquetes Relativos
import 'package:bloc/bloc.dart';

/// Import Entities
import 'package:listo/app/domain/entities/utils/error_dto.dart';
import 'package:listo/app/domain/entities/login_dto/permisos_dto.dart';

/// Import Abstract
import 'package:listo/app/domain/repositories/modulo_repository/abstract_modulo_repository.dart';
import 'package:listo/app/domain/repositories/preferences_repository/abstract_preferences_repository.dart';

/// Import Utils
import 'package:listo/app/data/utils/error_general.dart';
import 'package:listo/app/data/utils/custom_exception.dart';
import 'package:listo/app/data/utils/constantes_shared_preferences.dart';

part 'modulo_event.dart';
part 'modulo_state.dart';

class ModuloBloc extends Bloc<ModuloEvent, ModuloState> {
  final AbstractModuloRepository _abstractModuloRepository;
  final AbstractPreferencesRepository _preferencesRepository;

  ModuloBloc({
    required AbstractModuloRepository abstractModuloRepository,
    required AbstractPreferencesRepository preferencesRepository,
  })  : _preferencesRepository = preferencesRepository,
        _abstractModuloRepository = abstractModuloRepository,
        super(ModuloInitial());

  @override
  Stream<ModuloState> mapEventToState(ModuloEvent event) async* {
    if (event is ModuloInitial) {}

    if (event is ConsultarPermisos) {
      yield* _consultarPermisos();
    }

    if (event is ConsultarPermisosLocal) {
      yield* _consultarPermisosLocal();
    }
  }

  Stream<ModuloState> _consultarPermisos() async* {
    try {
      yield CargandoModuloState();
      final listaPermisos = await _abstractModuloRepository.consultarPermisos();

      await _preferencesRepository.save(
          ConstantesSharedPreferences.permisos, listaPermisos);

      yield ListaPermisosState(listaPermisos, 0);
    } on FetchDataException catch (e) {
      yield ErrorModuloState(e.error);
    } catch (_) {
      yield ErrorModuloState(ErrorGeneral().errorNoControlado());
    }
  }

  Stream<ModuloState> _consultarPermisosLocal() async* {
    try {
      yield CargandoModuloState();
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

      yield ListaPermisosState(permisosDTO, cantidadModulosHome);
    } on FetchDataException catch (e) {
      yield ErrorModuloState(e.error);
    } catch (_) {
      yield ErrorModuloState(ErrorGeneral().errorNoControlado());
    }
  }
}
