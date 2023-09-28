/// Import Libraries
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Import Entities
import 'package:listo/app/domain/entities/utils/error_dto.dart';
import 'package:listo/app/domain/entities/utils/opciones_dto.dart';
import 'package:listo/app/domain/entities/login_dto/login_dto.dart';
import 'package:listo/app/domain/entities/login_dto/sesion_dto.dart';
import 'package:listo/app/domain/entities/configuracion_dto/configuracion_dto.dart';

/// Import Providers
import 'package:listo/app/providers/providers.dart';

/// Import Abstracts
import 'package:listo/app/domain/repositories/login_repository/abstract_login_repository.dart';
import 'package:listo/app/domain/services/preferences_repository/abstract_preferences_repository.dart';

/// Import Utils
import 'package:listo/app/data/utils/error_general.dart';
import 'package:listo/app/data/utils/custom_exception.dart';
import 'package:listo/app/data/utils/constantes_shared_preferences.dart';

part 'login_state.dart';

class LoginStateController extends StateNotifier<LoginState> {
  final AbstractLoginRepository _abstractLoginRepository;
  final AbstractPreferencesRepository _preferencesRepository;
  final secureStorage = FlutterSecureStorage();

  LoginStateController(ProviderReference ref)
      : _preferencesRepository = ref.read(abstractPreferencesProvider),
        _abstractLoginRepository = ref.read(abstractLoginProvider),
        super(InicialState());

  void inicial() async {
    try {
      final token = await secureStorage.read(key: 'tokenSesion') ?? "";

      if (token.isNotEmpty) {
        state = AutenticadoState();
      }
    } catch (e) {
      state = ErrorState(ErrorGeneral().errorNoControlado());
    }
  }

  void consultarConfiguracion(LoginDto loginDto) async {
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
          key: ConstantesSharedPreferences.configuracion, value: configuracion);

      state = ConsultaRutasState(loginDto);
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

      state = ListaRutasState(listaRutas, inicioSesionDTO);
    } on FetchDataException catch (e) {
      state = ErrorState(e.error);
    } catch (_) {
      state = ErrorState(ErrorGeneral().errorNoControlado());
    }
  }

  void doLogin(LoginDto inicioSesionDTO) async {
    try {
      state = CargandoState();

      SesionDTO sesion =
          await _abstractLoginRepository.iniciarSesion(inicioSesionDTO);
      await secureStorage.write(key: 'tokenSesion', value: sesion.token);
      await secureStorage.write(
          key: 'codigoUsuario', value: sesion.codigoUsuario.toString());

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

      await secureStorage.delete(key: 'tokenSesion');
      await secureStorage.delete(key: 'codigoUsuario');

      state = LogoutState();
    } on FetchDataException catch (e) {
      state = ErrorState(e.error);
    } catch (_) {
      state = ErrorState(ErrorGeneral().errorNoControlado());
    }
  }
}
