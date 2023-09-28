/// Import Flutter
import 'package:flutter/material.dart';

/// Import Librarires
import 'package:listo/generated/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Import Injections
import 'package:listo/app/injection_controllers/injection_controllers.dart';

/// Import Routes
import 'package:listo/app/ui/routes/routes.dart';

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
    final _sizeScreen = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
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
              height: _sizeScreen.height * 0.06,
              width: 5,
              color: Color(0xFF346c94),
            ),
            Expanded(
              child: ListTile(
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
          title: Text(
            S.of(context).tituloCerrarSesion,
            style: TextStyle(
                color: Color(0xFF346c94),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            context.read(loginStateControllerProvider.notifier).cerrarSesion();

            NavegacionRutas()
                .redireccionarNombreRutaLimpiar(context, Routes.login);
          },
        )
      ],
    );
  }
}
