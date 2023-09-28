/// Import Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Import Libraries
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DeslizadorImagenesWidget extends StatefulWidget {
  final String? texto;

  const DeslizadorImagenesWidget({Key? key, this.texto}) : super(key: key);
  @override
  _DeslizadorImagenesStateWidget createState() =>
      _DeslizadorImagenesStateWidget();
}

class _DeslizadorImagenesStateWidget extends State<DeslizadorImagenesWidget> {
  final controller = PageController();

  final List<String> title = ['TEXT', 'TEXT2', 'TEXT3'];
  final List<String> descripcion = [
    'fdgafgaf asdgfagfadf afgafg',
    'adfgafgafgafgfgdg',
    'afgfgafafgaafdgadfgafa afgfgagf huihiuhuihui'
  ];
  final List<String> _imgList = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];
  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: _sizeScreen.height * 0.15,
            child: PageView.builder(
              itemCount: title.length,
              controller: controller,
              itemBuilder: (context, index) {
                return Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: FadeInImage(
                            image: NetworkImage(_imgList[index]),
                            placeholder: AssetImage('assets/img/loading.gif'),
                            fit: BoxFit.cover,
                            height: 160,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Color(0xFF4454d4),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: MaterialButton(
                                        height: 16,
                                        minWidth: 10,
                                        onPressed: () => {},
                                        child: Text(
                                          'Crea una cuenta',
                                          style: TextStyle(
                                              fontSize: 6, color: Colors.white),
                                        ),
                                        color: Color(0xFFF1f2e6f),
                                        shape: StadiumBorder(),
                                      ),
                                    ),
                                    Expanded(
                                        child: MaterialButton(
                                      height: 16,
                                      minWidth: 10,
                                      onPressed: () => {},
                                      child: Text(
                                        'Contacta a ventas',
                                        style: TextStyle(
                                            fontSize: 6, color: Colors.black),
                                      ),
                                      color: Colors.white,
                                      shape: StadiumBorder(),
                                    ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              width: _sizeScreen.width * 0.08,
              alignment: Alignment.topLeft,
              child: SmoothPageIndicator(
                controller: controller,
                count: _imgList.length,
                effect: ExpandingDotsEffect(
                    expansionFactor: 3,
                    dotColor: Color(0xFF346c94),
                    activeDotColor: Color(0xFF346c94),
                    dotHeight: 6.0,
                    dotWidth: 6.0,
                    spacing: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
