import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/constants/text_styles.dart';
import '../../../common/extensions/context_extensions.dart';
import '../../../models/item_icon.dart';

class IconView extends StatefulWidget {
  final Function(ItemIcon) onIconSelected;

  const IconView({Key key, this.onIconSelected}) : super(key: key);

  @override
  _IconViewState createState() => _IconViewState();
}

class _IconViewState extends State<IconView> {
  @override
  void initState() {
    super.initState();
  }

  List<ItemIcon> icons = ItemIcon.icones;

  int selectedIndex = 0;
  Icon icon = Icon(FontAwesomeIcons.folder);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDialog(context);
      },
      child: Column(
        children: <Widget>[
          Text(
            'selecione o ícone',
            style: subLabelStyle,
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[400],
              border: Border.all(color: Colors.grey[300]),
            ),
            child: icon,
          ),
        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    var item = await showDialog<ItemIcon>(
        context: context,
        builder: (context) {

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text("Selecion um ícone"),
              content: Container(
                width: context.width * .8,
                height: 200,
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: icons
                      .map<Widget>(
                        (item) => InkWell(
                          child: Icon(
                            item.icon,
                            size: 32,
                            color: selectedIndex == item.index
                                ? Colors.red
                                : Colors.grey,
                          ),
                          onTap: () {
                            setState(() {
                              selectedIndex = item.index;
                              icon = Icon(item.icon);
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  child: Text('CANCELAR'),
                ),
                FlatButton(
                  onPressed: () {
                    widget.onIconSelected(icons[selectedIndex]);
                    Modular.to.pop(icons[selectedIndex]);
                  },
                  child: Text('SELECIONAR'),
                ),
              ],
            );
          });
        });

        if (item != null) {
          setState(() {
            icon = Icon(item.icon);
          });
        }
  }
}
