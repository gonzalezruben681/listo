/// Import Flutter
import 'package:flutter/material.dart';

/// Import Widgets
import 'package:listo/app/ui/widgets/atom/logo_atom.dart';
import 'package:listo/app/ui/widgets/atom/imagen_atom.dart';
import 'package:listo/app/ui/pages/menu/atom/boton_menu_atom.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return AppBar(
      leading: Builder(
        // para abrir el drawer con el menú
        builder: (context) {
          return BotonMenuWidget(
            accion: () => {Scaffold.of(context).openDrawer()},
            child: ImagenAtom(
              ubicacionImagen: 'assets/img/menu.png',
              escalaImagen: 1,
            ),
            botonPrincipal: true,
          );
        },
      ),
      centerTitle: true,
      elevation: 13.0,
      toolbarHeight: _sizeScreen.height * 0.1,
      backgroundColor: Colors.white,
      title: Container(
        height: _sizeScreen.height * 0.08,
        width: _sizeScreen.width * 0.35,
        child: LogoAtom(),
      ),
      actions: [
        BotonMenuWidget(
          accion: () => {},
          child: ImagenAtom(
            ubicacionImagen: 'assets/img/impresora.png',
            escalaImagen: 1,
          ),
        )
      ],
    );
  }
}
