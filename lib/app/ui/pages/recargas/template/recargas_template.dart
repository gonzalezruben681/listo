/// Import Flutter
import 'package:flutter/material.dart';

/// Import Libreries
import 'package:sizer/sizer.dart';

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
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            10.h,
          ),
          child: MenuWidget()),
      body: Center(
        child: Text("Recargas"),
      ),
      drawer: Drawer(
        child: ListaMenuWidget(),
      ),
    );
  }
}
