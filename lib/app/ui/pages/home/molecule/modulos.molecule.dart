/// Import Flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listo/app/domain/notifiers/login/login_state_notifier.dart';
import 'package:listo/app/domain/notifiers/modulo/modulo_state_notifier.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

/// Import Librarires
import 'package:listo/generated/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Import Entities
import 'package:listo/app/domain/entities/login_dto/permisos_dto.dart';

/// Import Routes
import 'package:listo/app/ui/routes/routes.dart';

/// Import Blocs
//import 'package:listo/app/domain/blocs/login/login_bloc.dart';
//import 'package:listo/app/domain/blocs/modulo/modulo_bloc.dart';

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

class ModulosWidget extends StatefulWidget {
  ModulosWidget({Key? key}) : super(key: key);

  @override
  _ModulosWidgetState createState() => _ModulosWidgetState();
}

class _ModulosWidgetState extends State<ModulosWidget> {
  // late ModuloBloc _moduloBloc;

  @override
  void initState() {
    Future.delayed(
        Duration.zero,
        () => context
            .read(moduloStateNotifierProvider.notifier)
            .consultarPermisosLocal());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Builder(builder: (context) {
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
                            .read(loginStateNotifierProvider.notifier)
                            .cerrarSesion();
                        NavegacionRutas().redireccionarNombreRutaLimpiar(
                            context, Routes.login);
                      } else {
                        NavegacionRutas().cerrar(context);
                      }
                    },
                  ).botonPrimario(),
                ),
                context: context);
          }
        },
        child: Consumer(
          builder: (context, watch, child) {
            final state = watch(moduloStateNotifierProvider);
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
              children: _gernerarModulos(state.listaPermisos),
            );
          },
        ),
      );
    });
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

  List<Widget> _gernerarModulos(PermisosDTO permisos) {
    Map<String, dynamic> arreglo = test(context);
    List<Widget> listaWidget = [];

    permisos.toJson().forEach((key, value) {
      value as List<dynamic>;

      if (value.isNotEmpty && arreglo[key] != null) {
        var modulo = ModuloWidget(
          accion: () {
            NavegacionRutas().redireccionarWidget(
                context,
                ModuloOpcionesPage(
                  titulo: arreglo[key]['titulo'],
                ));
          },
          imagen: arreglo[key]['imagen'],
          titulo: arreglo[key]['titulo'],
        );

        listaWidget.add(modulo);
      }
    });

    return listaWidget;
  }
}
