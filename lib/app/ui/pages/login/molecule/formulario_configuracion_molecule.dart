/// Import Flutter
import 'package:flutter/material.dart';

import 'package:listo/app/domain/notifiers/configuracion/configuracion_state_notifier.dart';
import 'package:listo/app/ui/widgets/utils/ui_boton.dart';

/// Import Libraries
import 'package:listo/generated/l10n.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Import Entities
import 'package:listo/app/domain/entities/utils/opcion_dto.dart';
import 'package:listo/app/domain/entities/configuracion_dto/configuracion_dto.dart';

/// Import Blocs
//import 'package:listo/app/domain/blocs/configuracion/configuracion_bloc.dart';

/// Import Widgets
import 'package:listo/app/ui/widgets/utils/ui_texto.dart';
import 'package:listo/app/ui/pages/login/widgets/atom/logo_atom.dart';

import 'package:listo/app/ui/widgets/atom/lista_desplegable.dart';

/// Import Molecules
import 'package:listo/app/ui/widgets/molecule/mensajes_molecule.dart';
import 'package:listo/app/ui/widgets/molecule/modal_molecule.dart';
import 'package:listo/app/ui/widgets/utils/ui_campo.dart';

/// Import Utils
import 'package:listo/app/ui/utils/navegacion_rutas.dart';
import 'package:listo/app/ui/utils/validaciones_personalizadas.dart';

class FormularioConfiguracion extends HookWidget  {
  
  final FormGroup formClave = fb.group(<String, Object>{
    'clave': FormControl<String>(
      validators: [
        Validators.required,
        ValidacionesPersonalizadas().validarCampoClave
      ],
    ),
  });

  final FormGroup formConfiguracion = fb.group(<String, Object>{
    'urlPuente': FormControl<String>(
      validators: [
        Validators.required,
        ValidacionesPersonalizadas().validarSiHayEspacios,
        ValidacionesPersonalizadas().urlValida
      ],
    ),
    'puertoMovil': ['', Validators.required, Validators.number],
    'idioma': FormControl(
        value: OpcionDTO(id: "es", descripcion: "Español"),
        validators: [Validators.required])
  });

  @override
  Widget build(BuildContext context) {
    final state = useProvider(configuracionStateNotifierProvider);
    return ProviderListener(
      provider: configuracionStateNotifierProvider,
      onChange: (context, state) {
        if (state is GuardarConfiguracionState) {
          FocusManager.instance.primaryFocus!.unfocus();
          mensajeExito(context);
        }
      },
      child: Consumer(
        builder: (context, watch, child) {
          //final state = watch(configuracionStateNotifierProvider);
          if ((state is CambiarConfiguracionState)) {
            return Material(
              child: ReactiveFormBuilder(
                form: () => formConfiguracion,
                builder:
                    (BuildContext context, FormGroup formGroup, Widget? child) {
                  List<OpcionDTO> idiomaList = [
                    OpcionDTO(id: 'es', descripcion: S.of(context).espaniol),
                    OpcionDTO(id: 'en', descripcion: S.of(context).ingles)
                  ];

                  formConfiguracion.control('urlPuente').value =
                      state.configuracion.urlPuente;

                  formConfiguracion.control('puertoMovil').value =
                      state.configuracion.puertoMovil;

                  if (state.configuracion.idioma != null) {
                    formConfiguracion.control('idioma').value =
                        idiomaList.firstWhere((item) {
                      return item.id == state.configuracion.idioma;
                    });
                  }

                  return WillPopScope(
                    onWillPop: () {
                      return Future(() => false);
                    },
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          UiTexto()
                              .textoTitulo(S.of(context).tituloConfiguracion),
                          SizedBox(
                            height: 25.0,
                          ),
                          CampoTexto(
                            nombreFormulario: 'urlPuente',
                            etiquetaCampo: "Url",
                            sugerenciaCampo: "http://www.playtech.com:8081",
                            fuente: FontWeight.bold,
                            tipoTeclado: TextInputType.text,
                            mensajesError: (errores) => {
                              ValidationMessage.required:
                                  S.of(context).campoRequerido,
                              "sinEspacios": S.of(context).sinEspacios,
                              "urlValida": "Url invalida",
                            },
                          ),
                          CampoTexto(
                            nombreFormulario: 'puertoMovil',
                            etiquetaCampo: S.of(context).tituloPuerto,
                            fuente: FontWeight.bold,
                            tipoTeclado: TextInputType.number,
                            mensajesError: (errores) => {
                              ValidationMessage.required:
                                  S.of(context).campoRequerido,
                              ValidationMessage.number:
                                  S.of(context).soloNumeros
                            },
                          ),
                          SizedBox(height: 15.0),
                          ListaDesplegable(
                              titulo: S.of(context).tituloLenguaje,
                              nombreFormulario: 'idioma',
                              sugerenciaCampo: "Ingresa la clave",
                              mensajesError: (errores) => {
                                    ValidationMessage.required:
                                        S.of(context).campoRequerido,
                                  },
                              items: idiomaList),
                          SizedBox(height: 20.0),
                          UiBoton(
                                  texto: S.of(context).guardar,
                                  anchoBoton: "md",
                                  accion: () => guardarConfiguracion(context))
                              .botonPrimario(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return ReactiveFormBuilder(
              form: () => formClave,
              builder:
                  (BuildContext context, FormGroup formGroup, Widget? child) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      UiTexto()
                          .textoTitulo(S.of(context).tituloConfiguracionClave),
                      SizedBox(
                        height: 25.0,
                      ),
                      CampoContrasenia(
                        nombreFormulario: 'clave',
                        fuente: FontWeight.bold,
                        etiquetaCampo: S.of(context).tituloClave,
                        tipoTeclado: TextInputType.number,
                        mensajesError: (errores) => {
                          ValidationMessage.required:
                              S.of(context).campoRequerido,
                          "claveInvalida": S.of(context).claveInvalida,
                          "soloNumeros": S.of(context).soloNumeros,
                        },
                      ),
                      SizedBox(height: 30.0),
                      UiBoton(
                              texto: S.of(context).aceptar,
                              anchoBoton: "md",
                              accion: () => verificarCodigoDia(context))
                          .botonPrimario(),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void verificarCodigoDia(BuildContext context) {
    formClave.markAllAsTouched();
    if (formClave.valid) {
      context
          .read(configuracionStateNotifierProvider.notifier)
          .configurarClave(int.parse(formClave.control('clave').value));
    }
  }

  void mensajeExito( BuildContext context) async {
    await ModalMolecule().modal(
        child: MensajesMolecule(
          icon: LogoAtom(
            ubicacionImagen: 'assets/icon/exito.png',
            escalaImagen: 1,
          ),
          tituloMensaje: S.of(context).tituloMensajeExitoso,
          mensaje: S.of(context).mensajeConfiguracionExitosa,
          botones: UiBoton(
            anchoBoton: 'sm',
            texto: S.of(context).aceptar,
            accion: () {
              NavegacionRutas().cerrar(context);
            },
          ).botonPrimario(),
        ),
        context: context);

    NavegacionRutas().cerrar(context);
  }

  void guardarConfiguracion(BuildContext context) {
    formConfiguracion.markAllAsTouched();
    if (formConfiguracion.valid) {
      final configuracion = ConfiguracionDTO(
          idioma: formConfiguracion.control('idioma').value.id,
          puertoMovil: formConfiguracion.control('puertoMovil').value,
          urlPuente: formConfiguracion.control('urlPuente').value);

      context
          .read(configuracionStateNotifierProvider.notifier)
          .guardarConfiguracion(configuracion);
    }
  }
}
