/// Import Libraries
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Import Controllers
import 'package:listo/app/domain/controllers/login/login_state_controller.dart';
import 'package:listo/app/domain/controllers/configuracion/configuracion_state_controller.dart';
import 'package:listo/app/domain/controllers/modulo/modulo_state_controller.dart';

/// Configuracion
final configuracionStateControllerProvider = StateNotifierProvider.autoDispose<
    ConfiguracionStateController,
    ConfiguracionState>((ref) => ConfiguracionStateController(ref));

/// Login
final loginStateControllerProvider =
    StateNotifierProvider<LoginStateController, LoginState>(
        (ref) => LoginStateController(ref));

/// Modulos
final moduloStateNotifierProvider =
    StateNotifierProvider<ModuloStateNotifier, ModuloState>(
        (ref) => ModuloStateNotifier(ref));
