import 'package:flutter_modular/flutter_modular.dart';

import 'folder_detail_controller.dart';
import 'folder_detail_page.dart';

class FolderDetailModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FolderDetailController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => FolderDetailPage(
            folder: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<FolderDetailModule>.of();
}
