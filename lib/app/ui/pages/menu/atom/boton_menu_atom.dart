import 'package:flutter/material.dart';

/// Import Libreries
import 'package:sizer/sizer.dart';

// Import Utils
import 'package:listo/app/ui/utils/constantes_color_tema.dart';

class BotonMenuWidget extends StatefulWidget {
  BotonMenuWidget(
      {Key? key,
      required this.accion,
      required this.child,
      this.botonPrincipal = false})
      : super(key: key);

  final VoidCallback accion;
  final Widget child;
  final bool botonPrincipal;

  @override
  _BotonMenuWidgetState createState() => _BotonMenuWidgetState();
}

class _BotonMenuWidgetState extends State<BotonMenuWidget> {
  EdgeInsetsGeometry seleccionarMargin() {
    EdgeInsetsGeometry margin =
        EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0);
    if (!widget.botonPrincipal) {
      margin = EdgeInsets.only(right: 10.0, top: 15.0, bottom: 15.0);
    }

    return margin;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: 12.w,
      margin: seleccionarMargin(),
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
        icon: widget.child,
        onPressed: widget.accion,
        color: Color(ConstantesColorTema.azulFondos),
        padding: EdgeInsets.all(2),
      ),
    );
  }
}
