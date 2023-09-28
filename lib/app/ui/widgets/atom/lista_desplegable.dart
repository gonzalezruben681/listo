/// Import Flutter
import 'package:flutter/material.dart';

/// Import Libraries
import 'package:listo/generated/l10n.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';

/// Import Entities
import 'package:listo/app/domain/entities/utils/opcion_dto.dart';

class ListaDesplegable extends StatelessWidget {
  const ListaDesplegable({
    Key? key,
    this.nombreFormulario,
    this.mensajesError,
    this.sugerenciaCampo,
    this.etiquetaCampo,
    required this.items,
    this.titulo,
  }) : super(key: key);

  final String? nombreFormulario;
  final Map<String, String> Function(FormControl<dynamic>)? mensajesError;

  final String? sugerenciaCampo;
  final String? etiquetaCampo;
  final String? titulo;
  final List<OpcionDTO> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 42.0,
            margin: EdgeInsets.symmetric(horizontal: 29.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
            child: ReactiveDropdownSearch<OpcionDTO>(
              popupShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              formControlName: nombreFormulario,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                border: InputBorder.none,
              ),
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  contentPadding: EdgeInsets.fromLTRB(12, 10, 8, 0),
                  labelText: S.of(context).buscar,
                ),
              ),
              showSearchBox: true,
              popupTitle: Container(
                height: 45.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text(
                    titulo!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF346c94),
                    ),
                  ),
                ),
              ),
              items: items,
              itemAsString: (OpcionDTO item) => item.descripcion.toString(),
              dropdownBuilder: _customDropDownExample,
              popupItemBuilder: _customPopupItemBuilderExample2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _customDropDownExample(
      BuildContext context, OpcionDTO? item, String itemDesignation) {
    if (item == null) {
      return Container();
    }
    return Container(
      child: Text(
        item.descripcion.toString(),
      ),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, OpcionDTO item, bool isSelected) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.descripcion.toString()),
      ),
    );
  }
}
