import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../stores/auth_store.dart';

Widget appBar(BuildContext context) {
  final authStore = Modular.get<AuthStore>();

  return AppBar(
    elevation: 0,
    centerTitle: true,
    actions: <Widget>[
      IconButton(
        icon: Icon(FontAwesomeIcons.signOutAlt),
        onPressed: authStore.logout,
      )
    ],
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Cloud'),
        SizedBox(
          width: 2,
        ),
        Text(
          'GED',
          style:
              TextStyle(color: Color(0xFFAC4141), fontWeight: FontWeight.w800),
        ),
      ],
    ),
  );
}
