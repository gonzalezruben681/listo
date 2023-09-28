/// Import Flutter
import 'package:flutter/material.dart';

/// Import Libreries
import 'package:sizer/sizer.dart';

/// Import Entities
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
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            10.h,
          ),
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
