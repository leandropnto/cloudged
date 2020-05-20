import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemIcon {
  final int index;
  final IconData icon;
  final String name;

  static List<ItemIcon> icones = [
    ItemIcon(index: 0, icon: FontAwesomeIcons.folder, name: "folder"),
    ItemIcon(index: 1, icon: FontAwesomeIcons.fileWord, name: "fileWord"),
    ItemIcon(index: 2, icon: FontAwesomeIcons.filePdf, name: "filePdf"),
    ItemIcon(index: 3, icon: FontAwesomeIcons.images, name: "images"),
    ItemIcon(index: 4, icon: FontAwesomeIcons.soundcloud, name: "soundcloud"),
    ItemIcon(index: 5, icon: FontAwesomeIcons.video, name: "video"),
    ItemIcon(index: 6, icon: FontAwesomeIcons.wallet, name: "wallet"),
    ItemIcon(index: 7, icon: FontAwesomeIcons.xbox, name: "xbox"),
    ItemIcon(index: 8, icon: FontAwesomeIcons.trash, name: "trash"),
    ItemIcon(index: 9, icon: FontAwesomeIcons.truck, name: "truck"),
    ItemIcon(index: 10, icon: FontAwesomeIcons.tv, name: "tv"),
    ItemIcon(index: 11, icon: FontAwesomeIcons.twitter, name: "twitter"),
    ItemIcon(index: 12, icon: FontAwesomeIcons.umbrella, name: "umbrella"),
    ItemIcon(index: 13, icon: FontAwesomeIcons.user, name: "user"),
  ];

  ItemIcon({
    this.index,
    this.icon,
    this.name,
  });

  static IconData from([String name]) {
    return icones.where((item) => item.name == name).first.icon ?? icones[0];
  }
}
