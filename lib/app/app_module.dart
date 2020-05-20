import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/folder/folder_module.dart';
import 'modules/folder_detail/folder_detail_module.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/profile/profile_module.dart';
import 'repositories/folders_repository.dart';
import 'stores/auth_store.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthStore()),
        Bind((i) => FolderRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/login', module: LoginModule()),
        Router('/profile', module: ProfileModule()),
        Router('/foldernew', module: FolderModule()),
        Router('/folderdetail', module: FolderDetailModule()),

      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
