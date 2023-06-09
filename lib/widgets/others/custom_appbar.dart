// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../buttons/back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final bool centerTitle;
  final bool alwaysShowBackButton;
  CustomAppBar(
    this.title, {
    Key? key,
    this.centerTitle = false,
    this.alwaysShowBackButton = true,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: alwaysShowBackButton == true ? BackButtonWidget() : Container(),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      centerTitle: centerTitle,
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
    );
  }
}
