part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginInicial extends LoginEvent {}

class ConsultarConfiguracionBD extends LoginEvent {}

class ConsultarRutas extends LoginEvent {
  final LoginDto inicioSesionDTO;
  ConsultarRutas({required this.inicioSesionDTO});
}

class Login extends LoginEvent {
  final LoginDto inicioSesionDTO;
  Login({required this.inicioSesionDTO});
}

class CerrarSesion extends LoginEvent {}
