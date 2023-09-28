import 'package:flutter/material.dart';
import 'package:listo/app/ui/pages/menu/atom/boton_menu_atom.dart';

import 'package:sizer/sizer.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        // para abrir el drawer con el menú
        builder: (context) {
          return BotonMenuWidget(
            accion: () => {Scaffold.of(context).openDrawer()},
            child: Image.asset('assets/img/menu.png'),
            botonPrincipal: true,
          );
        },
      ),
      centerTitle: true,
      elevation: 13.0,
      toolbarHeight: 10.h,
      backgroundColor: Colors.white,
      title: Container(
        height: 8.h,
        width: 35.w,
        child: Image.asset('assets/img/logo_listo.png'),
      ),
      actions: [
        BotonMenuWidget(
          accion: () => {},
          child: Image.asset('assets/img/impresora.png'),
        )
      ],
    );
  }
}
