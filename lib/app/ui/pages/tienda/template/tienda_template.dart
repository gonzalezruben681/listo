/// Import Flutter
import 'package:flutter/material.dart';

/// Import Libreries
import 'package:sizer/sizer.dart';

/// Import Entities
import 'package:listo/app/ui/pages/menu/molecule/menu_lateral_molecule.dart';
import 'package:listo/app/ui/pages/menu/molecule/menu_molecule.dart';

class TiendaTemplate extends StatefulWidget {
  TiendaTemplate({Key? key}) : super(key: key);

  @override
  _TiendaTemplateState createState() => _TiendaTemplateState();
}

class _TiendaTemplateState extends State<TiendaTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            0.10.h,
          ),
          child: MenuWidget()),
      body: Center(
        child: Text("Tienda"),
      ),
      drawer: Drawer(
        child: ListaMenuWidget(),
      ),
    );
  }
}
