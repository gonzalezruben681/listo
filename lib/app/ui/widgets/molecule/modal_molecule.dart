/// Import Flutter
import 'package:flutter/material.dart';

class ModalMolecule {
  Future<dynamic> modal({
    EdgeInsets? padding,
    required BuildContext context,
    required Widget child,
  }) {
    final _screenSize = MediaQuery.of(context).size;
    return showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: SingleChildScrollView(
              child: Container(
                  width: _screenSize.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: padding ?? EdgeInsets.all(0),
                      child: child,
                    ),
                  )),
            )));
  }
}
