// Import Flutter
import 'package:flutter/material.dart';

/// Import Librarires
import 'package:listo/generated/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Import Entities
import 'package:listo/app/domain/entities/login_dto/login_dto.dart';

/// Import Rutas
import 'package:listo/app/ui/routes/routes.dart';

/// Import Injections
import 'package:listo/app/injection_controllers/injection_controllers.dart';

/// Import Controllers
import 'package:listo/app/domain/controllers/login/login_state_controller.dart';

/// Import Widgets
import 'package:listo/app/ui/widgets/atom/logo_atom.dart';
import 'package:listo/app/ui/widgets/atom/alerta_atom.dart';

/// Import Moleculas
import 'fomulario_lista_rutas_molecule.dart';
import 'formulario_configuracion_molecule.dart';
import 'package:listo/app/ui/widgets/molecule/modal_molecule.dart';
import 'package:listo/app/ui/widgets/molecule/cargando_molecule.dart';
import 'package:listo/app/ui/widgets/molecule/mensajes_molecule.dart';

/// Import Utils
import 'package:listo/app/ui/widgets/utils/ui_boton.dart';
import 'package:listo/app/ui/widgets/utils/ui_campo.dart';
import 'package:listo/app/ui/widgets/utils/ui_texto.dart';
import 'package:listo/app/ui/utils/navegacion_rutas.dart';
import 'package:listo/app/ui/utils/constantes_color_tema.dart';
import 'package:listo/app/ui/utils/validaciones_personalizadas.dart';

class FormularioInicioSesion extends StatefulHookWidget {
  FormularioInicioSesion({Key? key}) : super(key: key);
  @override
  _FormularioInicioSesionState createState() => _FormularioInicioSesionState();
}

class _FormularioInicioSesionState extends State<FormularioInicioSesion> {
  final FormGroup form = fb.group(<String, Object>{
    'correo': FormControl<String>(
      validators: [
        Validators.required,
        ValidacionesPersonalizadas().validarCampoUsuario
      ],
    ),
    'clave': [
      '',
      Validators.required,
      Validators.pattern(ValidacionesPersonalizadas.patternCaracteresInvalidos),
      Validators.maxLength(50)
    ],
  });
  @override
  void initState() {
    context.read(loginStateControllerProvider.notifier).inicial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: loginStateControllerProvider,
      onChange: (context, state) {
        if (state is AutenticadoState) {
          NavegacionRutas()
              .redireccionarNombreRutaLimpiar(context, Routes.home);
        }

        if (state is CargandoState) {
          AlertaAtom(CargandoMolecule()).alerta(context);
        }

        if (state is ErrorState) {
          NavegacionRutas().cerrar(context);
          FocusManager.instance.primaryFocus!.unfocus();
          ModalMolecule().modal(
              child: MensajesMolecule(
                icon: FaIcon(
                  FontAwesomeIcons.exclamationCircle,
                  color: Color(ConstantesColorTema.azulFondos),
                  size: 100,
                ),
                tituloMensaje: S.of(context).tituloMensajeError,
                mensaje: state.error!.mensaje,
                recomendacion: state.error!.recomendacion,
                botones: UiBoton(
                  anchoBoton: 'sm',
                  texto: S.of(context).aceptar,
                  accion: () {
                    NavegacionRutas().cerrar(context);
                  },
                ).botonPrimario(context),
              ),
              context: context);
          if (state.error!.codigo == '401') {
            context.read(loginStateControllerProvider.notifier).cerrarSesion();
          }
        }

        if (state is ConsultaRutasState) {
          NavegacionRutas().cerrar(context);
          _consultarRutas(context, state.loginDto);
        }

        if (state is ListaRutasState) {
          NavegacionRutas().cerrar(context);
          if (state.listaRutas.opciones.length == 1) {
            NavegacionRutas()
                .redireccionarNombreRutaLimpiar(context, Routes.home);
          } else {
            ModalMolecule().modal(
                padding: EdgeInsets.only(top: 35, bottom: 40),
                context: context,
                child: FormularioListaRutas(
                  listaRutas: state.listaRutas.opciones,
                  loginDto: state.loginDto,
                ));
          }
        }
        if (state is LoginExitosoState) {
          context
              .read(moduloStateNotifierProvider.notifier)
              .consultarPermisos();

          NavegacionRutas()
              .redireccionarNombreRutaLimpiar(context, Routes.home);
        }
      },
      child: ReactiveFormBuilder(
        form: () => form,
        builder: (BuildContext context, FormGroup formGroup, Widget? child) {
          return Column(
            children: [
              SizedBox(height: 10),
              Container(
                child: LogoAtom(),
              ),
              Column(
                children: [
                  CampoTexto(
                    etiquetaCampo: S.of(context).tituloCampoUsuario,
                    fuente: FontWeight.bold,
                    nombreFormulario: 'correo',
                    tipoTeclado: TextInputType.emailAddress,
                    mensajesError: (errores) => {
                      ValidationMessage.required: S.of(context).campoRequerido,
                      'numberInvalido': S.of(context).celularInvalido,
                      'emaiInvalido': S.of(context).correoInvalido,
                    },
                  ),
                  CampoContrasenia(
                    etiquetaCampo: S.of(context).tituloCampoContrasenia,
                    fuente: FontWeight.bold,
                    nombreFormulario: 'clave',
                    tipoTeclado: TextInputType.text,
                    mensajesError: (errores) => {
                      ValidationMessage.required: S.of(context).campoRequerido,
                      ValidationMessage.maxLength:
                          S.of(context).longitudMaximo(50),
                      ValidationMessage.pattern:
                          S.of(context).caracteresInvalidos,
                    },
                  ),
                  SizedBox(height: 10),
                  UiBoton(
                    texto: S.of(context).tituloBotonLogin,
                    accion: () => _consultarConfiguracionBD(context),
                    anchoBoton: "lg",
                  ).botonPrimario(context),
                  UiBoton(
                    texto: S.of(context).tituloBotonLogin,
                    accion: () => abrirConfiguracionConexion(context),
                    anchoBoton: "lg",
                  ).botonTexto(
                    UiTexto()
                        .textoTitulo(S.of(context).tituloConfiguracionClave),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  abrirConfiguracionConexion(BuildContext context) {
    ModalMolecule().modal(
        padding: EdgeInsets.only(top: 35, bottom: 40),
        child: FormularioConfiguracion(),
        context: context);
  }

  _consultarConfiguracionBD(BuildContext context) {
    form.markAllAsTouched();
    if (form.valid) {
      String? celular;
      String? correo;
      if (ValidacionesPersonalizadas().esNumero(form.control('correo').value)) {
        celular = form.control('correo').value;
      } else {
        correo = form.control('correo').value;
      }
      LoginDto _loginDto = LoginDto(
        correo: correo,
        celular: celular,
        clave: form.control('clave').value,
      );
      context
          .read(loginStateControllerProvider.notifier)
          .consultarConfiguracion(_loginDto);
    }
  }

  _consultarRutas(BuildContext context, LoginDto loginDto) {
    form.markAllAsTouched();

    context
        .read(loginStateControllerProvider.notifier)
        .consultarRutas(loginDto);
  }
}
