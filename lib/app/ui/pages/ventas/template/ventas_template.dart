/// Import Flutter
import 'package:flutter/material.dart';

/// Import Libreries
import 'package:sizer/sizer.dart';

/// Import Entities
import 'package:listo/app/ui/pages/menu/molecule/menu_lateral_molecule.dart';
import 'package:listo/app/ui/pages/menu/molecule/menu_molecule.dart';

class VentasTemplate extends StatefulWidget {
  VentasTemplate({Key? key}) : super(key: key);

  @override
  _VentasTemplateState createState() => _VentasTemplateState();
}

class _VentasTemplateState extends State<VentasTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            10.h,
          ),
          child: MenuWidget()),
      body: Center(
        child: Text("Ventas"),
      ),
      drawer: Drawer(
        child: ListaMenuWidget(),
      ),
    );
  }
}
