import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/extensions/context_extensions.dart';
import 'home_controller.dart';
import 'widgets/signin_button.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller


 @override
  void initState() {
    super.initState();
    controller.load();
  }


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
            left: 20,
            top: 120,
            width: context.width * .9,
            height: context.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset("assets/svgs/logo.svg",
                    width: 200, fit: BoxFit.cover, semanticsLabel: 'Acme Logo'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Bem-vindo ao',
                  style: context.textTheme.headline6.copyWith(
                      color: Colors.black54, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Cloud Ged',
                  style: context.textTheme.headline4.copyWith(
                      color: Colors.black54, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '''
Melhor plataforma de armazenamento na nuvem para empresas e pessoas que desejam administar seus dados.''',
                    maxLines: 5,
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.subtitle1),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SignInButton(
                      label: 'Touch ID',
                      onTap: () {},
                    ),
                    SignInButton(
                      label: 'Acessar',
                      icon: Icon(
                        Icons.lock_open,
                        color: Colors.white,
                      ),
                      color: Color(0x567DF4).withOpacity(1),
                      textColor: Colors.white,
                      onTap: () {
                        Modular.to.pushNamed('/login');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Ou use as redes sociais',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                        color: Colors.red,
                        icon: FaIcon(FontAwesomeIcons.google),
                        onPressed: () {}),
                    IconButton(
                        color: Colors.blue,
                        icon: FaIcon(FontAwesomeIcons.facebook),
                        onPressed: () {}),
                    IconButton(
                        color: Colors.green[800],
                        icon: FaIcon(FontAwesomeIcons.instagram),
                        onPressed: () {}),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: FlatButton(
                    child: Text('Criar conta'),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
