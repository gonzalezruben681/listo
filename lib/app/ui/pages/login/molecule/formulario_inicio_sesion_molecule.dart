/// Import Flutter
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Import Librarires
import 'package:listo/generated/l10n.dart';
import 'package:listo/hook_general.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Import Entities
import 'package:listo/app/domain/entities/login_dto/login_dto.dart';

/// Import Rutas
import 'package:listo/app/ui/routes/routes.dart';

/// Import notifier
import 'package:listo/app/domain/notifiers/login/login_state_notifier.dart';
import 'package:listo/app/domain/notifiers/modulo/modulo_state_notifier.dart';

/// Import Widgets
import 'package:listo/app/ui/widgets/atom/alerta_atom.dart';
import 'package:listo/app/ui/pages/login/widgets/atom/logo_atom.dart';

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

// ignore: must_be_immutable
class FormularioInicioSesion extends HookWidget {
  // late LoginBloc _loginBloc;
  late LoginDto _loginDto;

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
  Widget build(BuildContext context) {
    useCargarDatos(()=> context.read(loginStateNotifierProvider.notifier).inicial());
    return ProviderListener(
      provider: loginStateNotifierProvider,
      onChange: (context, state) {
        if (state is AutenticadoState) {
          NavegacionRutas()
              .redireccionarNombreRutaLimpiar(context, Routes.home);
        }

        if (state is CargandoState) {
          AlertaAtom(CargandoMolecule()).cargando(context);
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
                ).botonPrimario(),
              ),
              context: context);

          if (state.error!.codigo == '401') {
            context.read(loginStateNotifierProvider.notifier).cerrarSesion();
            // BlocProvider.of<LoginBloc>(context).add(CerrarSesion());
          }
        }

        if (state is ConsultaRutasState) {
          NavegacionRutas().cerrar(context);
          _consultarRutas(context);
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
                  loginDto: _loginDto,
                ));
          }
        }

        if (state is LoginExitosoState) {
          // NavegacionRutas().cerrar(context);
          context
              .read(moduloStateNotifierProvider.notifier)
              .consultarPermisos();
          // BlocProvider.of<ModuloBloc>(context).add(ConsultarPermisos());
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
                child: LogoAtom(
                  ubicacionImagen: 'assets/img/logo_listo.png',
                ),
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
                  ).botonPrimario(),
                  UiBoton(
                    texto: S.of(context).tituloBotonLogin,
                    accion:() => abrirConfiguracionConexion(context),
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
      context
          .read(loginStateNotifierProvider.notifier)
          .consultarConfiguracion();
      //_loginBloc.add(ConsultarConfiguracionBD());
    }
  }

  _consultarRutas(BuildContext context) {
    form.markAllAsTouched();
    if (form.valid) {
      String? celular;
      String? correo;

      if (ValidacionesPersonalizadas().esNumero(form.control('correo').value)) {
        celular = form.control('correo').value;
      } else {
        correo = form.control('correo').value;
      }

      _loginDto = LoginDto(
        correo: correo,
        celular: celular,
        clave: form.control('clave').value,
      );
      context
          .read(loginStateNotifierProvider.notifier)
          .consultarRutas(_loginDto);
      // _loginBloc.add(ConsultarRutas(inicioSesionDTO: _loginDto));
    }
  }
}
