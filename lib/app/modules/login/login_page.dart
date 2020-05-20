import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/constants/colors.dart';
import '../../common/extensions/context_extensions.dart';
import 'login_controller.dart';
import 'widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: customDrawer(context),
      //appBar: appBar(context),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SvgPicture.asset("assets/svgs/header.svg",
              width: context.width,
              fit: BoxFit.cover,
              semanticsLabel: 'Acme Logo'),
          Positioned(
            left: 10,
            top: 20,
            child: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.grey[600]),
              onPressed: () {
                Modular.to.pop();
              },
            ),
          ),
          Positioned(
            left: 20,
            bottom: 30,
            right: 20,
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SvgPicture.asset("assets/svgs/logo.svg",
                      width: 200,
                      fit: BoxFit.cover,
                      semanticsLabel: 'Acme Logo'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Cloud Ged',
                    style: context.textTheme.headline4.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.w800),
                  ),
                  Observer(builder: (_) {
                    return InputField(
                      onChanged: controller.setEmail,
                      icon: Icon(
                        FontAwesomeIcons.user,
                        color: Colors.grey[600],
                      ),
                    );
                  }),
                  SizedBox(
                    height: 15,
                  ),
                  Observer(builder: (_) {
                    return InputField(
                      isPassword: true,
                      label: 'Password',
                      onChanged: controller.setPassword,
                      icon:
                          Icon(FontAwesomeIcons.lock, color: Colors.grey[600]),
                    );
                  }),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: mainBlueColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    width: context.width,
                    height: 60,
                    child: FlatButton.icon(
                      onPressed: controller.login,
                      icon: Icon(
                        FontAwesomeIcons.lockOpen,
                        color: Colors.white,
                      ),
                      label: Text(
                        'ACESSAR',
                        style: context.textTheme.headline5.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
