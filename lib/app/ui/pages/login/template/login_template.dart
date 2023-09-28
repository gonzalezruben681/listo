/// Import Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Import Widgets
import 'package:listo/app/ui/widgets/atom/fondo_atom.dart';
import 'package:listo/app/ui/widgets/atom/tarjeta_atom.dart';
import 'package:listo/app/ui/pages/login/widgets/atom/slider_imagenes_atom.dart';

/// Import Pages
import 'package:listo/app/ui/pages/login/molecule/redes_sociales_molecule.dart';
import 'package:listo/app/ui/pages/login/molecule/formulario_inicio_sesion_molecule.dart';

/// Import Utils
import 'package:listo/app/ui/utils/constantes_color_tema.dart';

class LoginTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Color(ConstantesColorTema.azulFondos),
            ),
            FondoWidget("assets/img/fondo.png"),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: _sizeScreen.height * 0.15,
                  color: Color(ConstantesColorTema.azulLetras),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TarjetaWidget(
                              FormularioInicioSesion(),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TarjetaWidget(
                              DeslizadorImagenesWidget(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: RedesSocialesMolecule(),
    );
  }
}
