/// Import Flutter
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listo/app/ui/hooks/hook_general.dart';

/// Import Librarires
import 'package:listo/generated/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Import Entities
import 'package:listo/app/domain/entities/login_dto/permisos_dto.dart';

/// Import Routes
import 'package:listo/app/ui/routes/routes.dart';

/// Import Injections
import 'package:listo/app/injection_controllers/injection_controllers.dart';

/// Import Controllers
import 'package:listo/app/domain/controllers/modulo/modulo_state_controller.dart';

/// Import Pages
import 'package:listo/app/ui/pages/modulos_opciones/page/recargas_page.dart';

/// Import Molecules
import 'package:listo/app/ui/widgets/molecule/modal_molecule.dart';
import 'package:listo/app/ui/widgets/molecule/mensajes_molecule.dart';
import 'package:listo/app/ui/pages/home/molecule/modulo_molecule.dart';

/// Import Utils
import 'package:listo/app/ui/utils/navegacion_rutas.dart';
import 'package:listo/app/ui/widgets/utils/ui_boton.dart';
import 'package:listo/app/ui/utils/constantes_color_tema.dart';

class ModulosWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useCargarDatos(() => context
        .read(moduloStateNotifierProvider.notifier)
        .consultarPermisosLocal());
    final _sizeScreen = MediaQuery.of(context).size;
    final state = useProvider(moduloStateNotifierProvider);

    return ProviderListener(
        provider: moduloStateNotifierProvider,
        onChange: (context, state) {
          if (state is ErrorModuloState) {
            ModalMolecule().modal(
                child: MensajesMolecule(
                  icon: FaIcon(
                    FontAwesomeIcons.exclamationCircle,
                    color: Color(ConstantesColorTema.azulFondos),
                    size: 100,
                  ),
                  tituloMensaje: S.of(context).tituloMensajeError,
                  mensaje: state.errorDto!.mensaje,
                  recomendacion: state.errorDto!.recomendacion,
                  botones: UiBoton(
                    anchoBoton: 'sm',
                    texto: S.of(context).aceptar,
                    accion: () {
                      if (state.errorDto!.codigo == '401') {
                        context
                            .read(loginStateControllerProvider.notifier)
                            .cerrarSesion();
                        NavegacionRutas().redireccionarNombreRutaLimpiar(
                            context, Routes.login);
                      } else {
                        NavegacionRutas().cerrar(context);
                      }
                    },
                  ).botonPrimario(context),
                ),
                context: context);
          }
        },
        child: Builder(builder: (context) {
          double childAspectRatio = 1.1;
          if (_sizeScreen.width >= 750) {
            childAspectRatio = 1.6;
          }
          return GridView.count(
            shrinkWrap: true,
            childAspectRatio: childAspectRatio,
            padding: EdgeInsets.symmetric(vertical: 1),
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            children: _gernerarModulos(state.listaPermisos, context),
          );
        }));
  }

  Map<String, dynamic> test(BuildContext context) {
    Map<String, dynamic> arreglo = {
      "clientes": {
        "imagen": 'assets/img/clientes.png',
        "titulo": S.of(context).tituloModuloClientes,
      },
      "venta": {
        "imagen": 'assets/img/ventas.png',
        "titulo": S.of(context).tituloModuloVentas,
      },
      "recaudo": {
        "imagen": 'assets/img/recaudo.png',
        "titulo": S.of(context).tituloModuloRecaudo,
      },
      "recargas": {
        "imagen": 'assets/img/recargas.png',
        "titulo": S.of(context).tituloModuloRecargas,
      },
      "rifas": {
        "imagen": 'assets/img/rifas.png',
        "titulo": S.of(context).tituloModuloRifas,
      },
      "tienda": {
        "imagen": 'assets/img/tienda.png',
        "titulo": S.of(context).tituloModuloTienda,
      }
    };
    return arreglo;
  }

  List<Widget> _gernerarModulos(PermisosDTO permisos, BuildContext context) {
    Map<String, dynamic> modulosHome = test(context);
    List<Widget> listaWidget = [];

    permisos.toJson().forEach((key, value) {
      value as List<dynamic>;

      if (value.isNotEmpty && modulosHome[key] != null) {
        var modulo = ModuloWidget(
          accion: () {
            NavegacionRutas().redireccionarWidget(
                context,
                ModuloOpcionesPage(
                  modulosHome[key]['titulo'],
                ));
          },
          imagen: modulosHome[key]['imagen'],
          titulo: modulosHome[key]['titulo'],
        );

        listaWidget.add(modulo);
      }
    });

    return listaWidget;
  }
}
