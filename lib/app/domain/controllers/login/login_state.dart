part of 'login_state_controller.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InicialState extends LoginState {
  InicialState();
}

class CargandoState extends LoginState {}

class ErrorState extends LoginState {
  final ErrorDto? error;
  ErrorState(this.error);

  @override
  List<Object> get props => [error!];
}

class ConsultaRutasState extends LoginState {
  final LoginDto loginDto;
  ConsultaRutasState(this.loginDto);

  @override
  List<Object> get props => [loginDto];
}

class ListaRutasState extends LoginState {
  final OpcionesDTO listaRutas;
  final LoginDto loginDto;
  ListaRutasState(this.listaRutas, this.loginDto);

  @override
  List<Object> get props => [listaRutas];
}

class AutenticadoState extends LoginState {}

class LoginExitosoState extends LoginState {}

class LogoutState extends LoginState {}
