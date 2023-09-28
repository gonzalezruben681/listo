part of 'login_state_notifier.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InicialState extends LoginState {
  InicialState();
}

class AutenticadoState extends LoginState {}

class AutenticadoErrorState extends LoginState {}

class CargandoState extends LoginState {}

class ErrorState extends LoginState {
  final ErrorDto? error;
  ErrorState(this.error);

  @override
  List<Object> get props => [error!];
}

class ConsultaRutasState extends LoginState {}

class ListaRutasState extends LoginState {
  final OpcionesDTO listaRutas;
  ListaRutasState(this.listaRutas);

  @override
  List<Object> get props => [listaRutas];
}

class LoginExitosoState extends LoginState {}

class LogoutState extends LoginState {}
