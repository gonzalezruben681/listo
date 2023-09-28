/// Import Flutter
import 'package:flutter/material.dart';

/// Import Libraries
import 'package:reactive_forms/reactive_forms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Import Utils
import 'package:listo/app/ui/utils/constantes_color_tema.dart';

class CampoTexto extends StatelessWidget {
  CampoTexto({
    this.sugerenciaCampo,
    this.etiquetaCampo,
    this.tipoTeclado,
    this.icono,
    this.mensajesError,
    this.nombreFormulario,
    this.titulo,
    this.fuente,
    this.fontSize,
  });
  final String? titulo;
  final String? nombreFormulario;
  final Map<String, String> Function(FormControl<String>)? mensajesError;
  final String? sugerenciaCampo;
  final String? etiquetaCampo;
  final TextInputType? tipoTeclado;
  final FaIcon? icono;
  final FontWeight? fuente;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, right: 20),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 45.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2.0, 5.0),
                    )
                  ],
                ),
              ),
              ReactiveTextField<String>(
                  formControlName: nombreFormulario,
                  keyboardType: tipoTeclado,
                  decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      errorStyle: TextStyle(
                          // height: 1,
                          ),
                      hintText: sugerenciaCampo,
                      labelText: etiquetaCampo,
                      icon: icono,
                      labelStyle: TextStyle(
                        color: Color(ConstantesColorTema.azulLetras),
                        fontSize: fontSize,
                        background: Paint()..color = Colors.white,
                        fontFamily: 'Roboto-Medium',
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20.0, -4, 20.0, 10),
                      border: InputBorder.none),
                  validationMessages: mensajesError),
            ],
          ),
        ],
      ),
    );
  }
}

class CampoContrasenia extends StatefulWidget {
  CampoContrasenia({
    Key? key,
    this.sugerenciaCampo,
    this.etiquetaCampo,
    this.tipoTeclado,
    this.icono,
    this.mensajesError,
    this.nombreFormulario,
    this.titulo,
    this.fuente,
    this.fontSize,
  }) : super(key: key);
  final String? titulo;
  final String? nombreFormulario;
  final Map<String, String> Function(FormControl<String>)? mensajesError;
  final String? sugerenciaCampo;
  final String? etiquetaCampo;
  final TextInputType? tipoTeclado;
  final FaIcon? icono;
  final FontWeight? fuente;
  final double? fontSize;

  @override
  _CampoContraseniaWidgetState createState() => _CampoContraseniaWidgetState();
}

class _CampoContraseniaWidgetState extends State<CampoContrasenia> {
  bool _ocultar = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, right: 20),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 45.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2.0, 5.0),
                    )
                  ],
                ),
              ),
              ReactiveTextField<String>(
                key: widget.key,
                formControlName: widget.nombreFormulario,
                keyboardType: widget.tipoTeclado,
                obscureText: _ocultar,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, -4, 20.0, 1),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    errorStyle: TextStyle(
                      height: 1,
                    ),
                    border: InputBorder.none,
                    hintText: widget.sugerenciaCampo,
                    labelText: widget.etiquetaCampo,
                    labelStyle: TextStyle(
                      color: Color(ConstantesColorTema.azulLetras),
                      fontSize: widget.fontSize,
                      fontFamily: 'Roboto-Medium',
                    ),
                    icon: widget.icono,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _ocultar = !_ocultar;
                        });
                      },
                      child: Icon(
                        _ocultar ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF346c94),
                      ),
                    )),
                validationMessages: widget.mensajesError,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
