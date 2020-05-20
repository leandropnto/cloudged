import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/text_styles.dart';
import '../../common/extensions/context_extensions.dart';
import '../../common/widgets/app_bar.dart';
import '../login/widgets/input_field.dart';
import 'folder_controller.dart';
import 'widgets/color_view.dart';
import 'widgets/icon_view.dart';

class FolderPage extends StatefulWidget {
  final String title;
  const FolderPage({Key key, this.title = "Folder"}) : super(key: key);

  @override
  _FolderPageState createState() => _FolderPageState();
}

class _FolderPageState extends ModularState<FolderPage, FolderController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SvgPicture.asset(
                "assets/svgs/logo.svg",
                fit: BoxFit.contain,
                width: 200,
                height: 200,
              ),
              Text(
                'Nova Pasta',
                style: foldeNewLabelHeader,
              ),
              SizedBox(
                height: 20,
              ),
              Observer(builder: (_) {
                return InputField(
                  label: 'Nome',
                  onChanged: controller.setNome,
                  errorText: controller.nomeError,
                );
              }),
              SizedBox(
                height: 20,
              ),
              Observer(builder: (_) {
                return InputField(
                  label: 'Tipo',
                  onChanged: controller.setTipo,
                  errorText: controller.tipoError,
                );
              }),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ColorView(
                    onConfirmed: (cor) {
                      controller.setCor(
                          "0x${cor.value.toRadixString(16).toUpperCase()}");
                    },
                  ),
                  IconView(
                    onIconSelected: (item) {
                      controller.setIcon(item.name);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Observer(builder: (_) {
                return Container(
                  decoration: BoxDecoration(
                    color:
                        controller.canSave ? mainBlueColor : Colors.grey[400],
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  width: context.width,
                  height: 60,
                  child: FlatButton.icon(
                    onPressed: controller.canSave ? controller.save : null,
                    icon: Icon(
                      FontAwesomeIcons.solidSave,
                      color: Colors.white,
                    ),
                    label: Text(
                      'SALVAR',
                      style: context.textTheme.headline5.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
