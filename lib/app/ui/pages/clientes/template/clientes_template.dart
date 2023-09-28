import 'package:flutter/material.dart';
import 'package:listo/app/ui/pages/menu/molecule/menu_lateral_molecule.dart';

import 'package:listo/app/ui/pages/menu/molecule/menu_molecule.dart';
import 'package:sizer/sizer.dart';

class ClientesTemplate extends StatefulWidget {
  ClientesTemplate({Key? key}) : super(key: key);

  @override
  _ClientesTemplateState createState() => _ClientesTemplateState();
}

class _ClientesTemplateState extends State<ClientesTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            10.h,
          ),
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
