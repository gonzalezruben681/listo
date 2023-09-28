// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `----------modulo Principal ----------`
  String get moduloPrincipal {
    return Intl.message(
      '----------modulo Principal ----------',
      name: 'moduloPrincipal',
      desc: '',
      args: [],
    );
  }

  /// `Página Principal`
  String get tituloAppBar {
    return Intl.message(
      'Página Principal',
      name: 'tituloAppBar',
      desc: '',
      args: [],
    );
  }

  /// `----------modulo Login ----------`
  String get moduloLogin {
    return Intl.message(
      '----------modulo Login ----------',
      name: 'moduloLogin',
      desc: '',
      args: [],
    );
  }

  /// `Inicio de sesión`
  String get tituloLogin {
    return Intl.message(
      'Inicio de sesión',
      name: 'tituloLogin',
      desc: '',
      args: [],
    );
  }

  /// `Configuración de conexión`
  String get tituloConfiguracionClave {
    return Intl.message(
      'Configuración de conexión',
      name: 'tituloConfiguracionClave',
      desc: '',
      args: [],
    );
  }

  /// `Datos de conexión`
  String get tituloConfiguracion {
    return Intl.message(
      'Datos de conexión',
      name: 'tituloConfiguracion',
      desc: '',
      args: [],
    );
  }

  /// `Correo electrónico o número de celular`
  String get tituloCampoUsuario {
    return Intl.message(
      'Correo electrónico o número de celular',
      name: 'tituloCampoUsuario',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get tituloCampoContrasenia {
    return Intl.message(
      'Contraseña',
      name: 'tituloCampoContrasenia',
      desc: '',
      args: [],
    );
  }

  /// `Inicio sesión`
  String get tituloBotonLogin {
    return Intl.message(
      'Inicio sesión',
      name: 'tituloBotonLogin',
      desc: '',
      args: [],
    );
  }

  /// `Seleccione Ruta`
  String get tituloSeleccionarRuta {
    return Intl.message(
      'Seleccione Ruta',
      name: 'tituloSeleccionarRuta',
      desc: '',
      args: [],
    );
  }

  /// `Clave`
  String get tituloClave {
    return Intl.message(
      'Clave',
      name: 'tituloClave',
      desc: '',
      args: [],
    );
  }

  /// `Puerto`
  String get tituloPuerto {
    return Intl.message(
      'Puerto',
      name: 'tituloPuerto',
      desc: '',
      args: [],
    );
  }

  /// `Se ha guardado la configuración exitosamente`
  String get mensajeConfiguracionExitosa {
    return Intl.message(
      'Se ha guardado la configuración exitosamente',
      name: 'mensajeConfiguracionExitosa',
      desc: '',
      args: [],
    );
  }

  /// `Lenguaje`
  String get tituloLenguaje {
    return Intl.message(
      'Lenguaje',
      name: 'tituloLenguaje',
      desc: '',
      args: [],
    );
  }

  /// `----------modulo Home ----------`
  String get moduloHome {
    return Intl.message(
      '----------modulo Home ----------',
      name: 'moduloHome',
      desc: '',
      args: [],
    );
  }

  /// `Clientes`
  String get tituloModuloClientes {
    return Intl.message(
      'Clientes',
      name: 'tituloModuloClientes',
      desc: '',
      args: [],
    );
  }

  /// `Ventas`
  String get tituloModuloVentas {
    return Intl.message(
      'Ventas',
      name: 'tituloModuloVentas',
      desc: '',
      args: [],
    );
  }

  /// `Recaudo`
  String get tituloModuloRecaudo {
    return Intl.message(
      'Recaudo',
      name: 'tituloModuloRecaudo',
      desc: '',
      args: [],
    );
  }

  /// `Recargas`
  String get tituloModuloRecargas {
    return Intl.message(
      'Recargas',
      name: 'tituloModuloRecargas',
      desc: '',
      args: [],
    );
  }

  /// `Rifas`
  String get tituloModuloRifas {
    return Intl.message(
      'Rifas',
      name: 'tituloModuloRifas',
      desc: '',
      args: [],
    );
  }

  /// `Tienda`
  String get tituloModuloTienda {
    return Intl.message(
      'Tienda',
      name: 'tituloModuloTienda',
      desc: '',
      args: [],
    );
  }

  /// `----------modulo Menu ----------`
  String get moduloMenu {
    return Intl.message(
      '----------modulo Menu ----------',
      name: 'moduloMenu',
      desc: '',
      args: [],
    );
  }

  /// `Inicio`
  String get tituloPrincipal {
    return Intl.message(
      'Inicio',
      name: 'tituloPrincipal',
      desc: '',
      args: [],
    );
  }

  /// `Cerrar sesión`
  String get tituloCerrarSesion {
    return Intl.message(
      'Cerrar sesión',
      name: 'tituloCerrarSesion',
      desc: '',
      args: [],
    );
  }

  /// `----------modulo General----------`
  String get moduloGeneral {
    return Intl.message(
      '----------modulo General----------',
      name: 'moduloGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Inglés`
  String get ingles {
    return Intl.message(
      'Inglés',
      name: 'ingles',
      desc: '',
      args: [],
    );
  }

  /// `Español`
  String get espaniol {
    return Intl.message(
      'Español',
      name: 'espaniol',
      desc: '',
      args: [],
    );
  }

  /// `Aceptar`
  String get aceptar {
    return Intl.message(
      'Aceptar',
      name: 'aceptar',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get cancelar {
    return Intl.message(
      'Cancelar',
      name: 'cancelar',
      desc: '',
      args: [],
    );
  }

  /// `Guardar`
  String get guardar {
    return Intl.message(
      'Guardar',
      name: 'guardar',
      desc: '',
      args: [],
    );
  }

  /// `Buscar`
  String get buscar {
    return Intl.message(
      'Buscar',
      name: 'buscar',
      desc: '',
      args: [],
    );
  }

  /// `Proceso exitoso`
  String get tituloMensajeExitoso {
    return Intl.message(
      'Proceso exitoso',
      name: 'tituloMensajeExitoso',
      desc: '',
      args: [],
    );
  }

  /// `Ha ocurrido un error`
  String get tituloMensajeError {
    return Intl.message(
      'Ha ocurrido un error',
      name: 'tituloMensajeError',
      desc: '',
      args: [],
    );
  }

  /// `Cargando...`
  String get cargando {
    return Intl.message(
      'Cargando...',
      name: 'cargando',
      desc: '',
      args: [],
    );
  }

  /// `----------modulo Errores----------`
  String get moduloErrores {
    return Intl.message(
      '----------modulo Errores----------',
      name: 'moduloErrores',
      desc: '',
      args: [],
    );
  }

  /// `Este campo es requerido`
  String get campoRequerido {
    return Intl.message(
      'Este campo es requerido',
      name: 'campoRequerido',
      desc: '',
      args: [],
    );
  }

  /// `Celular inválido`
  String get celularInvalido {
    return Intl.message(
      'Celular inválido',
      name: 'celularInvalido',
      desc: '',
      args: [],
    );
  }

  /// `Correo inválido`
  String get correoInvalido {
    return Intl.message(
      'Correo inválido',
      name: 'correoInvalido',
      desc: '',
      args: [],
    );
  }

  /// `Clave inválida`
  String get claveInvalida {
    return Intl.message(
      'Clave inválida',
      name: 'claveInvalida',
      desc: '',
      args: [],
    );
  }

  /// `Este campo es de mínimo {numero}`
  String longitudMinimo(Object numero) {
    return Intl.message(
      'Este campo es de mínimo $numero',
      name: 'longitudMinimo',
      desc: '',
      args: [numero],
    );
  }

  /// `Este campo es de máximo {numero}`
  String longitudMaximo(Object numero) {
    return Intl.message(
      'Este campo es de máximo $numero',
      name: 'longitudMaximo',
      desc: '',
      args: [numero],
    );
  }

  /// `No se permiten los caracteres |, &`
  String get caracteresInvalidos {
    return Intl.message(
      'No se permiten los caracteres |, &',
      name: 'caracteresInvalidos',
      desc: '',
      args: [],
    );
  }

  /// `Solo se permiten números`
  String get soloNumeros {
    return Intl.message(
      'Solo se permiten números',
      name: 'soloNumeros',
      desc: '',
      args: [],
    );
  }

  /// `No se permiten espacios`
  String get sinEspacios {
    return Intl.message(
      'No se permiten espacios',
      name: 'sinEspacios',
      desc: '',
      args: [],
    );
  }

  /// `No tiene conexión a internet.`
  String get errorNavegacion {
    return Intl.message(
      'No tiene conexión a internet.',
      name: 'errorNavegacion',
      desc: '',
      args: [],
    );
  }

  /// `Verifique la conexión del dispositivo.`
  String get recomendacionErrorNavegacion {
    return Intl.message(
      'Verifique la conexión del dispositivo.',
      name: 'recomendacionErrorNavegacion',
      desc: '',
      args: [],
    );
  }

  /// `No se pudo realizar la conexión.`
  String get errorTimeOut {
    return Intl.message(
      'No se pudo realizar la conexión.',
      name: 'errorTimeOut',
      desc: '',
      args: [],
    );
  }

  /// `Comuniquese con el administrador del sistema.`
  String get recomendacionComuniqueseConAdm {
    return Intl.message(
      'Comuniquese con el administrador del sistema.',
      name: 'recomendacionComuniqueseConAdm',
      desc: '',
      args: [],
    );
  }

  /// `Error no controlado.`
  String get errorNoControlado {
    return Intl.message(
      'Error no controlado.',
      name: 'errorNoControlado',
      desc: '',
      args: [],
    );
  }

  /// `Configuracion vacia.`
  String get errorConfiguracionVacia {
    return Intl.message(
      'Configuracion vacia.',
      name: 'errorConfiguracionVacia',
      desc: '',
      args: [],
    );
  }

  /// `Por favor realice el proceso de configuracion.`
  String get recomendacionConfiguracionVacia {
    return Intl.message(
      'Por favor realice el proceso de configuracion.',
      name: 'recomendacionConfiguracionVacia',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es', countryCode: 'CO'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
