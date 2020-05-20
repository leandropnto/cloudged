import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constants/text_styles.dart';
import '../../../models/user.dart';

class HeaderView extends StatelessWidget {
  final User user;

  const HeaderView({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "assets/svgs/profile.svg",
                    height: 100,
                  )),
              Text(
                user.name ?? "",
                style: mainLabelStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                user.alias ?? "",
                style: subLabelStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  user.description ?? "",
                  style: descriptionTextStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
