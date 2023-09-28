part of 'modulo_state_notifier.dart';

abstract class ModuloState  {
  PermisosDTO get listaPermisos => PermisosDTO.fromJson({});

  int get cantidadModulosHome => 0;
}

class ModuloInitial extends ModuloState {}

class CargandoModuloState extends ModuloState {}

class ListaPermisosState extends ModuloState {
  final PermisosDTO listaPermisosNuevos;
  final int cantidadModulosHomeBack;

  ListaPermisosState(this.listaPermisosNuevos, this.cantidadModulosHomeBack);

  @override
  PermisosDTO get listaPermisos => listaPermisosNuevos;

  @override
  int get cantidadModulosHome => cantidadModulosHomeBack;
}

class ErrorModuloState extends ModuloState {
  final ErrorDto? errorDto;
  ErrorModuloState(this.errorDto);
}
