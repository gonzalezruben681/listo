/// Import Flutter
import 'package:flutter/material.dart';

/// Import Utils
import 'package:listo/app/ui/utils/navegacion_rutas.dart';
import 'package:listo/app/ui/utils/constantes_color_tema.dart';
import 'package:listo/app/ui/widgets/utils/ui_texto.dart';

class ModuloOpcionesTemplate extends StatefulWidget {
  ModuloOpcionesTemplate({Key? key, required this.titulo}) : super(key: key);

  final String titulo;

  @override
  _ModuloOpcionesTemplateState createState() => _ModuloOpcionesTemplateState();
}

class _ModuloOpcionesTemplateState extends State<ModuloOpcionesTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: menu(),
      body: Center(
        child: UiTexto().textoTitulo(widget.titulo),
      ),
    );
  }

  AppBar menu() {
    final _sizeScreen = MediaQuery.of(context).size;
    return AppBar(
        leading: Builder(
          builder: (context) {
            return Container(
              height: _sizeScreen.height * 0.12,
              width: _sizeScreen.width * 0.12,
              margin: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(1, 3))
                  ]),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 40,
                ),
                onPressed: () => NavegacionRutas().cerrar(context),
                color: Color(ConstantesColorTema.azulFondos),
                padding: EdgeInsets.all(2),
              ),
            );
          },
        ),
        centerTitle: true,
        elevation: 13.0,
        toolbarHeight: _sizeScreen.height * 0.10,
        backgroundColor: Colors.white,
        title: Container(
          child: UiTexto().textoTitulo(widget.titulo),
        ));
  }
}
