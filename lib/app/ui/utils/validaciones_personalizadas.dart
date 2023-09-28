/// Import Libreries
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:string_validator/string_validator.dart';

class ValidacionesPersonalizadas {
  static const String patternCorreo =
      r'^[a-z0-9+_-]+(?:\.[a-z0-9+_-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$';
  static const String patternCaracteresInvalidos = r'^[^&|]*$';
  static const String patternNumeros = r'^\d+$';
  static const String patternLetras = r'^[A-Za-zñÑÁÉÍÓÚÜáéíóúü\s]+$';
  static const String patternLetrasNumeros = r'^[A-Za-z0-9]+$';

  Map<String, dynamic>? validarCampoUsuario(AbstractControl<dynamic> control) {
    if (control.value != null) {
      final errorNumero = {'numberInvalido': true};
      final errorEmail = {'emaiInvalido': true};

      Map<String, dynamic>? error;

      bool emailValid = RegExp(patternCorreo).hasMatch(control.value);

      if (esNumero(control.value)) {
        if (control.value.toString().length < 8) {
          error = errorNumero;
        }
      } else {
        if (!emailValid) {
          error = errorEmail;
        }
      }

      return error;
    }
  }

  Map<String, dynamic>? validarCampoClave(AbstractControl<dynamic> control) {
    if (control.value != null) {
      final errorClaveInvalida = {'claveInvalida': true};
      final errorSoloNumeros = {'soloNumeros': true};

      final dia = DateFormat('d').format(DateTime.now());
      final anio = DateFormat('y').format(DateTime.now());
      final mes = DateFormat('M').format(DateTime.now());

      final int codigoValido =
          (int.parse(dia) * int.parse(anio)) + int.parse(mes);

      Map<String, dynamic>? error;

      if (esNumero(control.value)) {
        if (codigoValido != int.parse(control.value)) {
          error = errorClaveInvalida;
        }
      } else {
        error = errorSoloNumeros;
      }

      return error;
    }
  }

  Map<String, dynamic>? validarSiHayEspacios(AbstractControl<dynamic> control) {
    if (control.value != null) {
      final errorSinEspacios = {'sinEspacios': true};

      Map<String, dynamic>? error;

      if (control.value.toString().contains(' ')) {
        error = errorSinEspacios;
      }

      return error;
    }
  }

  Map<String, dynamic>? urlValida(AbstractControl<dynamic> control) {
    if (control.value != null) {
      final urlValida = {'urlValida': true};

      Map<String, dynamic>? error;

      if (!isURL(control.value.toString())) {
        error = urlValida;
      } else {}

      return error;
    }
  }

  bool esNumero(String str) {
    return double.tryParse(str) != null;
  }
}
