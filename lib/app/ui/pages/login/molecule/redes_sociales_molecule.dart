/// Import Flutter
import 'package:flutter/material.dart';

/// Import Libraries
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// Import Widgets
import 'package:listo/app/ui/utils/constantes_color_tema.dart';
import 'package:listo/app/ui/pages/login/widgets/atom/boton_redes_sociales_atom.dart';

class RedesSocialesMolecule extends StatelessWidget {
  const RedesSocialesMolecule();

  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Container(
        height: _sizeScreen.height * 0.07,
        padding: EdgeInsets.only(top: 5, bottom: 5),
        color: Color(ConstantesColorTema.azulLetras),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BotonRedesSocialesAtom(
              accion: () async {
                _launchSocial('fb://page/104057905090793',
                    'https://www.facebook.com/LISTO-104057905090793');
              },
              icono: FaIcon(
                FontAwesomeIcons.facebookF,
                size: 24,
              ),
            ),
            SizedBox(width: 10.0),
            BotonRedesSocialesAtom(
                accion: () async {
                  _launchSocial('twitter://user?screen_name=PlayTechla',
                      'https://twitter.com/PlayTechla?lang=es');
                },
                icono: FaIcon(
                  FontAwesomeIcons.twitter,
                  size: 15,
                )),
            SizedBox(width: 10.0),
            BotonRedesSocialesAtom(
              accion: () {
                _launchSocial('',
                    'https://instagram.com/listoplaytech?igshid=yu6l1hrma3d2');
              },
              icono: FaIcon(
                FontAwesomeIcons.instagram,
                size: 20,
              ),
            ),
          ],
        ));
  }

  void _launchSocial(String url, String fallbackUrl) async {
    try {
      bool launched =
          await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }
}
