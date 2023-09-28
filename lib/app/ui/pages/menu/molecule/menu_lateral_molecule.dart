import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:listo/app/domain/blocs/login/login_bloc.dart';
import 'package:listo/app/domain/notifiers/login/login_state_notifier.dart';
import 'package:listo/app/ui/routes/routes.dart';

/// Import Librarires
import 'package:sizer/sizer.dart';
import 'package:listo/generated/l10n.dart';

/// Import Utils
import 'package:listo/app/ui/utils/navegacion_rutas.dart';

class ListaMenuWidget extends StatefulWidget {
  ListaMenuWidget({Key? key}) : super(key: key);

  @override
  _ListaMenuWidgetState createState() => _ListaMenuWidgetState();
}

class _ListaMenuWidgetState extends State<ListaMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        /*     _drawerHeaderMenu(_screenSize),
        _rutaActual(), */
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Color(0xFF346c94),
          height: 10,
          indent: 40.0,
          endIndent: 40.0,
          thickness: 1.0,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              height: 6.h,
              width: 5,
              color: Color(0xFF346c94),
            ),
            Expanded(
              child: ListTile(
                /* leading: Image.asset(
                  'assets/img/página_principal.png',
                  fit: BoxFit.contain,
                ), */
                title: Text(
                  S.of(context).tituloPrincipal,
                  style: TextStyle(
                      color: Color(0xFF346c94),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  NavegacionRutas()
                      .redireccionarNombreRutaLimpiar(context, Routes.home);
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        ListTile(
          /* leading: Image.asset(
        imagen,
        fit: BoxFit.contain,
      ), */
          title: Text(
            S.of(context).tituloCerrarSesion,
            style: TextStyle(
                color: Color(0xFF346c94),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            //  BlocProvider.of<LoginBloc>(context).add(CerrarSesion());
            context.read(loginStateNotifierProvider.notifier).cerrarSesion();
            NavegacionRutas()
                .redireccionarNombreRutaLimpiar(context, Routes.login);
          },
        )
      ],
    );
  }
}
