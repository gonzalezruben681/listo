import 'package:flutter/material.dart';

class CarruselWidget extends StatefulWidget {
  @override
  _CarruselWidgetState createState() => _CarruselWidgetState();
}

class _CarruselWidgetState extends State<CarruselWidget> {
  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Container(
        height: _sizeScreen.height * 0.20,
        width: double.infinity,
        color: Colors.blue,
        child: Center(child: Text('')));
  }
}
