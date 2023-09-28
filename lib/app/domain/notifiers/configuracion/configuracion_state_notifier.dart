/// Import Flutter
//import 'dart:async';

/// Import Libraries
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Import Entities
import 'package:listo/app/domain/entities/configuracion_dto/configuracion_dto.dart';
import 'package:listo/app/domain/notifiers/login/login_state_notifier.dart';

/// Import Abstracts
import 'package:listo/app/domain/repositories/preferences_repository/abstract_preferences_repository.dart';

/// Import Utils
import 'package:listo/app/data/utils/constantes_shared_preferences.dart';

part 'configuracion_state.dart';

// injeccion
final configuracionStateNotifierProvider =
    StateNotifierProvider.autoDispose<ConfiguracionStateNotifier, ConfiguracionState>(
        (ref) => ConfiguracionStateNotifier(ref));

class ConfiguracionStateNotifier extends StateNotifier<ConfiguracionState> {
  final AbstractPreferencesRepository _preferencesRepository;
  final ConfiguracionInicial _initialState;

  ConfiguracionStateNotifier(ProviderReference ref)
      : _preferencesRepository = ref.read(abstractPreferencesProvider),
      _initialState = ConfiguracionInicial(),
        super(ConfiguracionInicial());

  ConfiguracionInicial get initialState => _initialState;

  void consultarConfiguracion() async {
    try {
      final Map<String, dynamic>? resultado = await _preferencesRepository
          .read(ConstantesSharedPreferences.configuracion);

      ConfiguracionDTO configuracion = ConfiguracionDTO.fromJson(resultado!);
      state = SetInicialState(configuracion);
    } catch (e) {
      state = ErrorState();
    }
  }

  void configurarClave(int claveDia) async {
    try {
      state = CargandoState();

      final resultado = await _preferencesRepository
          .read(ConstantesSharedPreferences.configuracion);

      ConfiguracionDTO configuracion = ConfiguracionDTO.fromJson(resultado);

      state = CambiarConfiguracionState(configuracion);
    } catch (_) {
      state = ErrorState();
    }
  }

  void guardarConfiguracion(ConfiguracionDTO configuracion) async {
    try {
      state = CargandoState();

      await _preferencesRepository.save(
          ConstantesSharedPreferences.configuracion, configuracion);

      state = GuardarConfiguracionState(configuracion);
    } catch (_) {
      state = ErrorState();
    }
  }
}
