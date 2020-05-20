import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../stores/auth_store.dart';

import '../extensions/context_extensions.dart';

Widget customDrawer(BuildContext context) {
  final authStore = Modular.get<AuthStore>();
  final user = authStore.user;

  return Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.verified_user,
                  size: 60,
                  color: Colors.white60,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Observer(builder: (_) {
                    return Text(
                      user?.name ?? 'Bem-vindo!',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.headline5.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    );
                  }),
                )
              ],
            )),
          ),
          ListTile(
            title: Text('Login'),
            trailing: Icon(Icons.supervised_user_circle),
          ),
          ListTile(
            title: Text('Pastas'),
            trailing: Icon(Icons.folder),
          ),
        ],
      ),
    ),
  );
}
