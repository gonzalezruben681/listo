/// Import Flutter
import 'dart:async';
import 'package:bloc/bloc.dart';

/// Import Libraries
import 'package:equatable/equatable.dart';

/// Import Entities
import 'package:listo/app/domain/entities/configuracion_dto/configuracion_dto.dart';

/// Import Abstracts
import 'package:listo/app/domain/repositories/preferences_repository/abstract_preferences_repository.dart';

/// Import Utils
import 'package:listo/app/data/utils/constantes_shared_preferences.dart';

part 'configuracion_event.dart';
part 'configuracion_state.dart';

class ConfiguracionBloc extends Bloc<ConfiguracionEvent, ConfiguracionState> {
  final AbstractPreferencesRepository _preferencesRepository;
  final ConfiguracionInicial _initialState;

  ConfiguracionBloc({
    required AbstractPreferencesRepository preferencesRepository,
    required ConfiguracionDTO initialLocale,
  })  : _preferencesRepository = preferencesRepository,
        _initialState = ConfiguracionInicial(),
        super(ConfiguracionState());

  ConfiguracionInicial get initialState => _initialState;

  @override
  Stream<ConfiguracionState> mapEventToState(ConfiguracionEvent event) async* {
    if (event is ConfiguracionInicial) {
      yield* _consultarConfiguracion();
    }

    if (event is ConfigurarClave) {
      yield* _configurarClave(claveDia: event.claveDia);
    }

    if (event is GuardarConfiguracion) {
      yield* _guardarConfiguracion(configuracion: event.configuracion);
    }
  }

  Stream<ConfiguracionState> _consultarConfiguracion() async* {
    try {
      final Map<String, dynamic>? resultado = await _preferencesRepository
          .read(ConstantesSharedPreferences.configuracion);

      ConfiguracionDTO configuracion = ConfiguracionDTO.fromJson(resultado!);
      yield SetInicialState(configuracion);
    } catch (e) {
      yield ErrorState();
    }
  }

  Stream<ConfiguracionState> _configurarClave({required int claveDia}) async* {
    try {
      yield CargandoState();

      final resultado = await _preferencesRepository
          .read(ConstantesSharedPreferences.configuracion);

      ConfiguracionDTO configuracion = ConfiguracionDTO.fromJson(resultado);

      yield CambiarConfiguracionState(configuracion);
    } catch (_) {
      yield ErrorState();
    }
  }

  Stream<ConfiguracionState> _guardarConfiguracion(
      {required ConfiguracionDTO configuracion}) async* {
    try {
      yield CargandoState();

      await _preferencesRepository.save(
          ConstantesSharedPreferences.configuracion, configuracion);

      yield GuardarConfiguracionState(configuracion);
    } catch (_) {
      yield ErrorState();
    }
  }
}
