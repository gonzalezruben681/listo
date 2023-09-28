/// Import Flutter
import 'package:flutter/material.dart';

/// Import Molecules
import 'package:listo/app/ui/pages/menu/molecule/menu_molecule.dart';
import 'package:listo/app/ui/pages/menu/molecule/menu_lateral_molecule.dart';

class ClientesTemplate extends StatefulWidget {
  ClientesTemplate({Key? key}) : super(key: key);

  @override
  _ClientesTemplateState createState() => _ClientesTemplateState();
}

class _ClientesTemplateState extends State<ClientesTemplate> {
  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(_sizeScreen.height * 0.1),
          child: MenuWidget()),
      body: Center(
        child: Text("Clientes"),
      ),
      drawer: Drawer(
        child: ListaMenuWidget(),
      ),
    );
  }
}
