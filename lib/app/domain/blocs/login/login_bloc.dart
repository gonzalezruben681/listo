/// Import flutter
import 'dart:io';
import 'dart:async';
import 'package:bloc/bloc.dart';

/// Import Libraries
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

part 'login_event_bloc.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AbstractLoginRepository _abstractLoginRepository;
  final AbstractPreferencesRepository _preferencesRepository;

  LoginBloc({
    required AbstractLoginRepository abstractLoginRepository,
    required AbstractPreferencesRepository preferencesRepository,
  })  : _preferencesRepository = preferencesRepository,
        _abstractLoginRepository = abstractLoginRepository,
        super(InicialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInicial) {
      yield* _inicial();
    } else if (event is ConsultarConfiguracionBD) {
      yield* _consultarConfiguracion();
    } else if (event is ConsultarRutas) {
      yield* _consultarRutas(inicioSesionDTO: event.inicioSesionDTO);
    } else if (event is Login) {
      yield* _doLogin(inicioSesionDTO: event.inicioSesionDTO);
    } else if (event is CerrarSesion) {
      yield* _cerrarSesion();
    }
  }

  Stream<LoginState> _inicial() async* {
    try {
      final secureStorage = FlutterSecureStorage();

      final token = await secureStorage.read(key: 'tokenSesion') ?? "";

      if (token.isNotEmpty) {
        yield AutenticadoState();
      }
    } on SocketException {
      yield ErrorState(ErrorGeneral().errorNavegacion());
    } catch (e) {
      yield ErrorState(ErrorGeneral().errorNoControlado());
    }
  }

  Stream<LoginState> _consultarConfiguracion() async* {
    try {
      yield CargandoState();

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

      yield ConsultaRutasState();
    } on FetchDataException catch (e) {
      yield ErrorState(e.error);
    } catch (e) {
      yield ErrorState(ErrorGeneral().errorNoControlado());
    }
  }

  Stream<LoginState> _consultarRutas(
      {required LoginDto inicioSesionDTO}) async* {
    try {
      yield CargandoState();

      final listaRutas =
          await _abstractLoginRepository.consultarRutas(inicioSesionDTO);

      yield ListaRutasState(listaRutas);
    } on FetchDataException catch (e) {
      yield ErrorState(e.error);
    } catch (_) {
      yield ErrorState(ErrorGeneral().errorNoControlado());
    }
  }

  Stream<LoginState> _doLogin({required LoginDto inicioSesionDTO}) async* {
    try {
      yield CargandoState();

      await _abstractLoginRepository.login(inicioSesionDTO);

      yield LoginExitosoState();
    } on FetchDataException catch (e) {
      yield ErrorState(e.error);
    } catch (_) {
      yield ErrorState(ErrorGeneral().errorNoControlado());
    }
  }

  Stream<LoginState> _cerrarSesion() async* {
    try {
      _abstractLoginRepository.logout();
      await _preferencesRepository.remove(ConstantesSharedPreferences.permisos);
      yield LogoutState();
    } on FetchDataException catch (e) {
      yield ErrorState(e.error);
    } catch (_) {
      yield ErrorState(ErrorGeneral().errorNoControlado());
    }
  }
}
