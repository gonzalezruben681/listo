import 'package:flutter/material.dart';

/// Import Molecules
import 'package:listo/app/ui/pages/menu/molecule/menu_molecule.dart';
import 'package:listo/app/ui/pages/home/molecule/modulos.molecule.dart';
import 'package:listo/app/ui/pages/home/molecule/carrusel.molecule.dart';
import 'package:listo/app/ui/pages/home/molecule/graficas_molecule.dart';
import 'package:listo/app/ui/pages/menu/molecule/menu_lateral_molecule.dart';

class HomeTemplate extends StatefulWidget {
  HomeTemplate({Key? key}) : super(key: key);

  @override
  _HomeTemplateState createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                _sizeScreen.height * 0.10,
              ),
              child: MenuWidget()),
          body: Stack(children: [
            Column(
              children: [
                CarruselWidget(),
                ModulosWidget(),
              ],
            ),
            GraficasWidget(),
          ]),
          drawer: Drawer(
            child: ListaMenuWidget(),
          ),
        ),
      ),
    );
  }
}
