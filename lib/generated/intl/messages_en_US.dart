// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static String m0(numero) => "This field is maximum ${numero}";

  static String m1(numero) => "This field is minimum ${numero}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aceptar": MessageLookupByLibrary.simpleMessage("Accept"),
        "buscar": MessageLookupByLibrary.simpleMessage("Search"),
        "campoRequerido":
            MessageLookupByLibrary.simpleMessage("This field is required"),
        "cancelar": MessageLookupByLibrary.simpleMessage("Cancel"),
        "caracteresInvalidos": MessageLookupByLibrary.simpleMessage(
            "The characters |, & are not allowed"),
        "cargando": MessageLookupByLibrary.simpleMessage("Loading..."),
        "celularInvalido": MessageLookupByLibrary.simpleMessage("Invalid cell"),
        "claveInvalida":
            MessageLookupByLibrary.simpleMessage("Inválid password"),
        "correoInvalido": MessageLookupByLibrary.simpleMessage("Invalid email"),
        "errorConfiguracionVacia":
            MessageLookupByLibrary.simpleMessage("Configuration empty."),
        "errorNavegacion": MessageLookupByLibrary.simpleMessage(
            "It has no internet connection."),
        "errorNoControlado":
            MessageLookupByLibrary.simpleMessage("Uncontrolled error."),
        "errorTimeOut": MessageLookupByLibrary.simpleMessage(
            "The connection could not be made."),
        "espaniol": MessageLookupByLibrary.simpleMessage("Spanish"),
        "guardar": MessageLookupByLibrary.simpleMessage("Save"),
        "ingles": MessageLookupByLibrary.simpleMessage("English"),
        "longitudMaximo": m0,
        "longitudMinimo": m1,
        "mensajeConfiguracionExitosa": MessageLookupByLibrary.simpleMessage(
            "The configuration has been saved successfully"),
        "moduloErrores": MessageLookupByLibrary.simpleMessage(
            "----------modulo Errores----------"),
        "moduloGeneral": MessageLookupByLibrary.simpleMessage(
            "----------modulo General----------"),
        "moduloHome": MessageLookupByLibrary.simpleMessage(
            "----------modulo Home ----------"),
        "moduloLogin": MessageLookupByLibrary.simpleMessage(
            "----------modulo Login ----------"),
        "moduloMenu": MessageLookupByLibrary.simpleMessage(
            "----------modulo Menu ----------"),
        "moduloPrincipal": MessageLookupByLibrary.simpleMessage(
            "----------modulo Principal ----------"),
        "recomendacionComuniqueseConAdm": MessageLookupByLibrary.simpleMessage(
            "Contact your system administrator."),
        "recomendacionConfiguracionVacia": MessageLookupByLibrary.simpleMessage(
            "Please go through the setup process."),
        "recomendacionErrorNavegacion": MessageLookupByLibrary.simpleMessage(
            "Check the device connection."),
        "sinEspacios":
            MessageLookupByLibrary.simpleMessage("No spaces allowed"),
        "soloNumeros":
            MessageLookupByLibrary.simpleMessage("Only numbers are allowed"),
        "tituloAppBar": MessageLookupByLibrary.simpleMessage("Principal Page"),
        "tituloBotonLogin": MessageLookupByLibrary.simpleMessage("Login"),
        "tituloCampoContrasenia":
            MessageLookupByLibrary.simpleMessage("Password"),
        "tituloCampoUsuario":
            MessageLookupByLibrary.simpleMessage("Email or cell phone number"),
        "tituloCerrarSesion": MessageLookupByLibrary.simpleMessage("Log out"),
        "tituloClave": MessageLookupByLibrary.simpleMessage("Key"),
        "tituloConfiguracion":
            MessageLookupByLibrary.simpleMessage("Connection data"),
        "tituloConfiguracionClave":
            MessageLookupByLibrary.simpleMessage("Connection settings"),
        "tituloLenguaje": MessageLookupByLibrary.simpleMessage("Language"),
        "tituloLogin": MessageLookupByLibrary.simpleMessage("Log in"),
        "tituloMensajeError":
            MessageLookupByLibrary.simpleMessage("An error has occurred"),
        "tituloMensajeExitoso":
            MessageLookupByLibrary.simpleMessage("Successful process"),
        "tituloModuloClientes":
            MessageLookupByLibrary.simpleMessage("Customers"),
        "tituloModuloRecargas": MessageLookupByLibrary.simpleMessage("Top-up"),
        "tituloModuloRecaudo":
            MessageLookupByLibrary.simpleMessage("Fundraising"),
        "tituloModuloRifas": MessageLookupByLibrary.simpleMessage("Raffles"),
        "tituloModuloTienda": MessageLookupByLibrary.simpleMessage("Shop"),
        "tituloModuloVentas": MessageLookupByLibrary.simpleMessage("Sales"),
        "tituloPrincipal": MessageLookupByLibrary.simpleMessage("Home"),
        "tituloPuerto": MessageLookupByLibrary.simpleMessage("Port"),
        "tituloSeleccionarRuta":
            MessageLookupByLibrary.simpleMessage("Select Route")
      };
}
