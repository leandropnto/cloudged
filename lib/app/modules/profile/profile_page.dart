import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/text_styles.dart';
import '../../common/widgets/app_bar.dart';
import '../../common/widgets/custom_drawer.dart';
import 'profile_controller.dart';
import 'widgets/folders_view.dart';
import 'widgets/header_view.dart';
import 'widgets/recent_uploads_view.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key key, this.title = "Profile"}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    super.initState();
    controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      drawer: customDrawer(context),
      body: CustomScrollView(
        slivers: <Widget>[
          Observer(builder: (_) {
            return HeaderView(
              user: controller.user,
            );
          }),
          makeHeader('Minhas Pastas',
              backgroundColor: mainAccentColor,
              labelColor: Colors.white,
              actions: [
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Modular.to.pushNamed("/foldernew");
                    }),
                IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    onPressed: controller.load),
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.stepForward,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ]),
          Observer(builder: (_) {
            return FoldersView(folders: controller.folders);
          }),
          makeHeader('Últimos Uploads',
              backgroundColor: Color(0xFFDEDEDE),
              actions: [
                IconButton(
                    icon: Icon(FontAwesomeIcons.sortAlphaDown,
                        color: mainAccentColor),
                    onPressed: () {}),
              ]),
          Observer(builder: (_) => RecentUploadsView(files: controller.files)),
        ],
      ),
    );
  }

  SliverPersistentHeader makeHeader(
    String headerText, {
    List<Widget> actions,
    Color backgroundColor = Colors.grey,
    Color labelColor = Colors.black,
  }) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 100.0,
        child: Container(
          padding: EdgeInsets.all(8),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                headerText,
                style: subLabelStyle.copyWith(
                    fontWeight: FontWeight.bold, color: labelColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions ?? List.of([]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
