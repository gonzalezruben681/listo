/// Import Flutter
import 'package:flutter/material.dart';

/// Import Libraries
import 'package:listo/generated/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Import Entities
import 'package:listo/app/domain/entities/utils/opcion_dto.dart';
import 'package:listo/app/domain/entities/configuracion_dto/configuracion_dto.dart';

/// Import Controller
import 'package:listo/app/domain/controllers/configuracion/configuracion_state_controller.dart';

/// Import Injections
import 'package:listo/app/injection_controllers/injection_controllers.dart';

/// Import Widgets
import 'package:listo/app/ui/widgets/utils/ui_texto.dart';
import 'package:listo/app/ui/widgets/utils/ui_boton.dart';
import 'package:listo/app/ui/widgets/utils/ui_campo.dart';
import 'package:listo/app/ui/widgets/atom/imagen_atom.dart';
import 'package:listo/app/ui/widgets/atom/lista_desplegable.dart';

/// Import Molecules
import 'package:listo/app/ui/widgets/molecule/mensajes_molecule.dart';
import 'package:listo/app/ui/widgets/molecule/modal_molecule.dart';

/// Import Utils
import 'package:listo/app/ui/utils/navegacion_rutas.dart';
import 'package:listo/app/ui/utils/validaciones_personalizadas.dart';

// ignore: must_be_immutable
class FormularioConfiguracion extends HookWidget {
  late FormGroup formConfiguracion;
  late FormGroup formClave;

  void _formBuilder(BuildContext context) {
    formConfiguracion = fb.group(<String, Object>{
      'urlPuente': FormControl<String>(
        validators: [
          Validators.required,
          ValidacionesPersonalizadas().validarSiHayEspacios,
          Validators.pattern(ValidacionesPersonalizadas.patternUrl),
        ],
      ),
      'puertoMovil': ['', Validators.required, Validators.number],
      'idioma': FormControl(
          value: OpcionDTO(id: "es", descripcion: S.of(context).espaniol),
          validators: [Validators.required])
    });

    formClave = fb.group(<String, Object>{
      'clave': FormControl<String>(
        validators: [
          Validators.required,
          ValidacionesPersonalizadas().validarCampoClave
        ],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = useProvider(configuracionStateControllerProvider);

    return ProviderListener(
        provider: configuracionStateControllerProvider,
        onChange: (context, state) {
          if (state is ConfiguracionGuardarState) {
            FocusManager.instance.primaryFocus!.unfocus();
            mensajeExito(context);
          }
        },
        child: configuracionWidget(state, context));
  }

  void verificarCodigoDia(BuildContext context) {
    formClave.markAllAsTouched();
    if (formClave.valid) {
      context
          .read(configuracionStateControllerProvider.notifier)
          .configurarClave(int.parse(formClave.control('clave').value));
    }
  }

  Widget configuracionWidget(ConfiguracionState state, BuildContext context) {
    _formBuilder(context);
    if ((state is ConfiguracionActualizarState)) {
      return Material(
        child: ReactiveFormBuilder(
          form: () => formConfiguracion,
          builder: (BuildContext context, FormGroup formGroup, Widget? child) {
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
                    UiTexto().textoTitulo(S.of(context).tituloConfiguracion),
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
                        ValidationMessage.pattern: S.of(context).urlInvalida,
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
                        ValidationMessage.number: S.of(context).soloNumeros
                      },
                    ),
                    SizedBox(height: 15.0),
                    ListaDesplegable(
                        titulo: S.of(context).tituloLenguaje,
                        nombreFormulario: 'idioma',
                        mensajesError: (errores) => {
                              ValidationMessage.required:
                                  S.of(context).campoRequerido,
                            },
                        items: idiomaList),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        UiBoton(
                                accion: () => _cancelar(context),
                                texto: S.of(context).cancelar,
                                anchoBoton: "sm")
                            .botonSecundario(context),
                        UiBoton(
                                texto: S.of(context).guardar,
                                anchoBoton: "sm",
                                accion: () => guardarConfiguracion(context))
                            .botonPrimario(context),
                      ],
                    )
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
        builder: (BuildContext context, FormGroup formGroup, Widget? child) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UiTexto().textoTitulo(S.of(context).tituloConfiguracionClave),
                SizedBox(
                  height: 25.0,
                ),
                CampoContrasenia(
                  nombreFormulario: 'clave',
                  fuente: FontWeight.bold,
                  etiquetaCampo: S.of(context).tituloClave,
                  tipoTeclado: TextInputType.number,
                  mensajesError: (errores) => {
                    ValidationMessage.required: S.of(context).campoRequerido,
                    "claveInvalida": S.of(context).claveInvalida,
                    "soloNumeros": S.of(context).soloNumeros,
                  },
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UiBoton(
                            accion: () => _cancelar(context),
                            texto: S.of(context).cancelar,
                            anchoBoton: "sm")
                        .botonSecundario(context),
                    UiBoton(
                      accion: () => verificarCodigoDia(context),
                      texto: S.of(context).aceptar,
                      anchoBoton: "sm",
                    ).botonPrimario(context),
                  ],
                )
              ],
            ),
          );
        },
      );
    }
  }

  void mensajeExito(BuildContext context) async {
    await ModalMolecule().modal(
        child: MensajesMolecule(
          icon: ImagenAtom(
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
          ).botonPrimario(context),
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
          .read(configuracionStateControllerProvider.notifier)
          .guardarConfiguracion(configuracion);
    }
  }

  void _cancelar(BuildContext context) {
    NavegacionRutas().cerrar(context);
  }
}
