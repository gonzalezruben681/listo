/// Import flutter
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Import Libraries
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:listo/app/data/repository_impl/login_repository_impl/login_repository_impl.dart';
import 'package:listo/app/data/repository_impl/preferences_repository_impl/preferences_repository_impl.dart';

/// Import Entities
import 'package:listo/app/domain/entities/utils/error_dto.dart';
import 'package:listo/app/domain/entities/utils/opciones_dto.dart';
import 'package:listo/app/domain/entities/login_dto/login_dto.dart';
import 'package:listo/app/domain/entities/configuracion_dto/configuracion_dto.dart';

/// Import Abstracts
import 'package:listo/app/domain/repositories/login_repository/abstract_login_repository.dart';
import 'package:listo/app/domain/repositories/preferences_repository/abstract_preferences_repository.dart';

/// Import Utils
import 'package:listo/app/data/utils/error_general.dart';
import 'package:listo/app/data/utils/custom_exception.dart';
import 'package:listo/app/data/utils/constantes_shared_preferences.dart';

part 'login_state.dart';

// injeccion
final loginStateNotifierProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>(
        (ref) => LoginStateNotifier(ref));

//Provider
final abstractLoginProvider =
    Provider<AbstractLoginRepository>((ref) => LoginRepositoryImpl());
    
final abstractPreferencesProvider = Provider<AbstractPreferencesRepository>(
    (ref) => PreferencesRepositoryImpl()); 

class LoginStateNotifier extends StateNotifier<LoginState> {
  final AbstractLoginRepository _abstractLoginRepository;
  final AbstractPreferencesRepository _preferencesRepository;

  LoginStateNotifier(ProviderReference ref)
      : _preferencesRepository = ref.read(abstractPreferencesProvider),
        _abstractLoginRepository = ref.read(abstractLoginProvider),
        super(InicialState());

  void inicial() async {
    try {
      final secureStorage = FlutterSecureStorage();

      final token = await secureStorage.read(key: 'tokenSesion') ?? "";

      if (token.isNotEmpty) {
        state = AutenticadoState();
      }
    } on SocketException {
      state = ErrorState(ErrorGeneral().errorNavegacion());
    } catch (e) {
      state = ErrorState(ErrorGeneral().errorNoControlado());
    }
  }

  void consultarConfiguracion() async {
    try {
      state = CargandoState();

      final ConfiguracionDTO configuracionBD =
          await _abstractLoginRepository.consultarConfiguracion();

      final configuracionSharePreference = ConfiguracionDTO.fromJson(
          await _preferencesRepository
              .read(ConstantesSharedPreferences.configuracion));

      ConfiguracionDTO configuracion = ConfiguracionDTO(
          urlPuente: configuracionBD.urlPuente,
          puertoMovil: configuracionBD.puertoMovil,
          idioma: configuracionSharePreference.idioma);

      await _preferencesRepository.save(
          ConstantesSharedPreferences.configuracion, configuracion);

      state = ConsultaRutasState();
    } on FetchDataException catch (e) {
      state = ErrorState(e.error);
    } catch (e) {
      state = ErrorState(ErrorGeneral().errorNoControlado());
    }
  }

  void consultarRutas(LoginDto inicioSesionDTO) async {
    try {
      state = CargandoState();

      final listaRutas =
          await _abstractLoginRepository.consultarRutas(inicioSesionDTO);

      state = ListaRutasState(listaRutas);
    } on FetchDataException catch (e) {
      state = ErrorState(e.error);
    } catch (_) {
      state = ErrorState(ErrorGeneral().errorNoControlado());
    }
  }

  void doLogin(LoginDto inicioSesionDTO) async {
    try {
      state = CargandoState();

      await _abstractLoginRepository.login(inicioSesionDTO);

      state = LoginExitosoState();
    } on FetchDataException catch (e) {
      state = ErrorState(e.error);
    } catch (_) {
      state = ErrorState(ErrorGeneral().errorNoControlado());
    }
  }

  void cerrarSesion() async {
    try {
      _abstractLoginRepository.logout();
      await _preferencesRepository.remove(ConstantesSharedPreferences.permisos);
      state = LogoutState();
    } on FetchDataException catch (e) {
      state = ErrorState(e.error);
    } catch (_) {
      state = ErrorState(ErrorGeneral().errorNoControlado());
    }
  }
}
