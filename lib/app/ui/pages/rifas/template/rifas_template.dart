/// Import Flutter
import 'package:flutter/material.dart';

/// Import Molecules
import 'package:listo/app/ui/pages/menu/molecule/menu_lateral_molecule.dart';
import 'package:listo/app/ui/pages/menu/molecule/menu_molecule.dart';

class RifasTemplate extends StatefulWidget {
  RifasTemplate({Key? key}) : super(key: key);

  @override
  _RifasTemplateState createState() => _RifasTemplateState();
}

class _RifasTemplateState extends State<RifasTemplate> {
  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(_sizeScreen.height * 0.1),
          child: MenuWidget()),
      body: Center(
        child: Text("Rifas"),
      ),
      drawer: Drawer(
        child: ListaMenuWidget(),
      ),
    );
  }
}
