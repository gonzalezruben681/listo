/// Import flutter
import 'package:flutter/material.dart';

/// Import Libraries
import 'package:listo/generated/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Import Injections
import 'package:listo/app/injection_controllers/injection_controllers.dart';

/// Import Entities
import 'package:listo/app/domain/entities/utils/opcion_dto.dart';
import 'package:listo/app/domain/entities/login_dto/login_dto.dart';

/// Import widgets
import 'package:listo/app/ui/widgets/utils/ui_texto.dart';
import 'package:listo/app/ui/widgets/utils/ui_boton.dart';
import 'package:listo/app/ui/widgets/atom/lista_desplegable.dart';

/// Import Utils
import 'package:listo/app/ui/utils/navegacion_rutas.dart';

// ignore: must_be_immutable
class FormularioListaRutas extends HookWidget {
  final LoginDto loginDto;
  final List<OpcionDTO>? listaRutas;
  FormularioListaRutas({required this.loginDto, required this.listaRutas});

  late FormGroup form;

  @override
  Widget build(BuildContext context) {
    form = fb.group(<String, Object>{
      'menurutas': FormControl<OpcionDTO>(
          validators: [Validators.required],
          value: OpcionDTO(
            id: listaRutas![0].id,
            descripcion: listaRutas![0].descripcion,
          ))
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UiTexto().textoTitulo(
          S.of(context).tituloSeleccionarRuta,
        ),
        SizedBox(
          height: 20,
        ),
        ReactiveFormBuilder(
            form: () => form,
            builder:
                (BuildContext context, FormGroup formGroup, Widget? child) {
              return ListaDesplegable(
                nombreFormulario: 'menurutas',
                items: listaRutas!,
                titulo: S.of(context).tituloSeleccionarRuta,
              );
            }),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UiBoton(
                    accion: () => _cancelar(context),
                    texto: S.of(context).cancelar,
                    anchoBoton: "sm")
                .botonSecundario(context),
            UiBoton(
              accion: () => _iniciarSesion(context),
              texto: S.of(context).aceptar,
              anchoBoton: "sm",
            ).botonPrimario(context),
          ],
        )
      ],
    );
  }

  _iniciarSesion(BuildContext context) {
    if (form.valid) {
      LoginDto _inicioSesionDTO = LoginDto(
          codigoRuta: form.control('menurutas').value.id,
          clave: loginDto.clave,
          correo: loginDto.correo,
          celular: loginDto.celular,
          version: '3.0.0',
          plataforma: 'Hibrido');

      context
          .read(loginStateControllerProvider.notifier)
          .doLogin(_inicioSesionDTO);
    }
  }

  void _cancelar(BuildContext context) {
    NavegacionRutas().cerrar(context);
  }
}
