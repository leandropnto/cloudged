import 'package:flutter_modular/flutter_modular.dart';

import 'folder_controller.dart';
import 'folder_page.dart';

class FolderModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FolderController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FolderPage()),
      ];

  static Inject get to => Inject<FolderModule>.of();
}
