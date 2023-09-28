/// Import Flutter
import 'package:flutter/material.dart';

/// Import Molecules
import 'package:listo/app/ui/pages/menu/molecule/menu_molecule.dart';
import 'package:listo/app/ui/pages/menu/molecule/menu_lateral_molecule.dart';

class RecargasTemplate extends StatefulWidget {
  RecargasTemplate({Key? key}) : super(key: key);

  @override
  _RecargasTemplateState createState() => _RecargasTemplateState();
}

class _RecargasTemplateState extends State<RecargasTemplate> {
  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(_sizeScreen.height * 0.1),
          child: MenuWidget()),
      body: Center(
        child: Text("Recaudo"),
      ),
      drawer: Drawer(
        child: ListaMenuWidget(),
      ),
    );
  }
}
