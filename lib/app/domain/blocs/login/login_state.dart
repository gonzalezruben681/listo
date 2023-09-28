part of 'login_bloc.dart';

class LoginState {}

class InicialState extends LoginState {
  InicialState();
}

class AutenticadoState extends LoginState {}

class AutenticadoErrorState extends LoginState {}

class CargandoState extends LoginState {}

class ErrorState extends LoginState {
  final ErrorDto? error;
  ErrorState(this.error);
}

class ConsultaRutasState extends LoginState {}

class ListaRutasState extends LoginState {
  final OpcionesDTO listaRutas;
  ListaRutasState(this.listaRutas);
}

class LoginExitosoState extends LoginState {}

class LogoutState extends LoginState {}
