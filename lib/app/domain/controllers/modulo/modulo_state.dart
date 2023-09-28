part of 'modulo_state_controller.dart';

abstract class ModuloState extends Equatable {
  PermisosDTO get listaPermisos => PermisosDTO.fromJson({});

  int get cantidadModulosHome => 0;

  @override
  List<Object?> get props => [];
}

class ModuloInitial extends ModuloState {
  @override
  List<Object?> get props => [];
}

class CargandoModuloState extends ModuloState {}

class ListaPermisosState extends ModuloState {
  final PermisosDTO listaPermisosNuevos;
  final int cantidadModulosHomeBack;

  ListaPermisosState(this.listaPermisosNuevos, this.cantidadModulosHomeBack);

  @override
  PermisosDTO get listaPermisos => listaPermisosNuevos;

  @override
  int get cantidadModulosHome => cantidadModulosHomeBack;

  @override
  List<Object?> get props => [listaPermisosNuevos, cantidadModulosHomeBack];
}

class ErrorModuloState extends ModuloState {
  final ErrorDto? errorDto;
  ErrorModuloState(this.errorDto);

  @override
  List<Object?> get props => [errorDto];
}
