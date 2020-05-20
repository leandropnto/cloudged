import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../common/constants/text_styles.dart';

class ColorView extends StatefulWidget {
  final Function(Color) onConfirmed;

  const ColorView({Key key, this.onConfirmed}) : super(key: key);

  @override
  _ColorViewState createState() => _ColorViewState();
}

class _ColorViewState extends State<ColorView> {
  Color cor = Colors.grey;
  Color selected = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openDialog("Selecione a cor", context);
      },
      child: Column(
        children: <Widget>[
          Text(
            'selecione a cor',
            style: subLabelStyle,
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: cor,
              //borderRadius: BorderRadius.circular(20),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]),
            ),
          ),
        ],
      ),
    );
  }

  void _openDialog(String title, BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: MaterialColorPicker(
            onColorChange: ( color) {
              setState(() {
                selected = color;
              });
            },
            selectedColor: Colors.red,
            colors: [
              Colors.red,
              Colors.deepOrange,
              Colors.yellow,
              Colors.lightGreen,
              Colors.grey,
              Colors.blue,
              Colors.lime,
              Colors.pink,
              Colors.purple,
              Colors.teal,
              Colors.amber

            ],
          ),
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
                child: Text('CONFIRMAR'),
                onPressed: () {
                  setState(() {
                    cor = selected;
                  });
                  widget.onConfirmed(cor);
                  Modular.to.pop();
                }),
          ],
        );
      },
    );
  }
}
