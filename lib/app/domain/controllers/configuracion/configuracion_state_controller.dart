/// Import Libraries
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Import Entities
import 'package:listo/app/domain/entities/configuracion_dto/configuracion_dto.dart';

/// Import Providers
import 'package:listo/app/providers/providers.dart';

/// Import Abstracts
import 'package:listo/app/domain/services/preferences_repository/abstract_preferences_repository.dart';

/// Import Utils
import 'package:listo/app/data/utils/constantes_shared_preferences.dart';

part 'configuracion_state.dart';

class ConfiguracionStateController extends StateNotifier<ConfiguracionState> {
  final AbstractPreferencesRepository _preferencesRepository;
  final ConfiguracionInicial _initialState;

  ConfiguracionStateController(ProviderReference ref)
      : _preferencesRepository = ref.read(abstractPreferencesProvider),
        _initialState = ConfiguracionInicial(),
        super(ConfiguracionInicial());

  ConfiguracionInicial get initialState => _initialState;

  void consultarConfiguracion() async {
    try {
      final Map<String, dynamic>? resultado = await _preferencesRepository
          .read(ConstantesSharedPreferences.configuracion);

      ConfiguracionDTO configuracion = ConfiguracionDTO.fromJson(resultado!);
      state = ConfiguracionInicialState(configuracion);
    } catch (e) {
      state = ConfiguracionErrorState();
    }
  }

  void configurarClave(int claveDia) async {
    try {
      state = ConfiguracionCargandoState();

      final resultado = await _preferencesRepository
          .read(ConstantesSharedPreferences.configuracion);

      ConfiguracionDTO configuracion = ConfiguracionDTO.fromJson(resultado);

      state = ConfiguracionActualizarState(configuracion);
    } catch (_) {
      state = ConfiguracionErrorState();
    }
  }

  void guardarConfiguracion(ConfiguracionDTO configuracion) async {
    try {
      state = ConfiguracionCargandoState();

      await _preferencesRepository.save(
          key: ConstantesSharedPreferences.configuracion, value: configuracion);

      state = ConfiguracionGuardarState(configuracion);
    } catch (_) {
      state = ConfiguracionErrorState();
    }
  }
}
