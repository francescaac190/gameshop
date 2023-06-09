// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gameshop/routes/routes.dart';
import 'package:get/get.dart';
import '../../../utils/assets.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/drawer_utils.dart';
import '../../../utils/size.dart';
import '../../../utils/strings.dart';
import '../../../widgets/others/svg_icon.dart';
import 'package:share_plus/share_plus.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width / 1.35,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.radius * 2),
        )),
        backgroundColor: CustomColor.primaryBackgroundColor,
        child: Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: [
            _closeDrawerButtonWidget(context),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.heightSize * 3),
              child: ListView(
                children: [
                  _userInformationWidget(context),
                  _drawerWidget(context),
                  _signOutButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _closeDrawerButtonWidget(BuildContext context) {
    return IconButton(
      icon: SvgIcon(
        asset: StaticAssets.cross,
        height: 14,
        width: 14,
        color: CustomColor.textColor,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }

  _userInformationWidget(BuildContext context) {
    return Column(
      children: [
        _userImage(context),
        _userTitle(context),
      ],
    );
  }

  _userImage(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: Dimensions.radius * 8,
        backgroundColor: const Color(CustomColor.five),
        child: CircleAvatar(
            radius: Dimensions.radius * 7.2,
            child: Container(
              decoration: const BoxDecoration(
                  color: CustomColor.transparent,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(StaticAssets.profilePic),
                      fit: BoxFit.cover)),
              // child: Image.asset(StaticAssets.freeFireINCODE, fit: BoxFit.fill,),
            )),
      ),
    );
  }

  _userTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 2.2),
      child: Column(
        children: [
          Text(
            '1000.00 USD',
            style: TextStyle(
              fontSize: Dimensions.profileNameTextSize,
              fontWeight: FontWeight.w600,
              color: CustomColor.textColor,
            ),
          ),
          Text(
            Strings.currentBalance,
            style: CustomStyle.defaultSubTitleStyle,
          ),
        ],
      ),
    );
  }

  _drawerWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      mainAxisAlignment: mainCenter,
      children: [
        ...DrawerUtils.items.map((item) {
          return _drawerTileWidget(
            item['icon'],
            item['title'],
            onTap: () => Get.toNamed(
              '${item['route']}',
              arguments: {
                'route': 'profile',
              },
            ),
          );
        }),
        _drawerTileWidget(FontAwesomeIcons.share, Strings.shareApp, onTap: () {
          Share.share(
            "Download the latest Game Shop App on Play store\n\n"
            ")",
          );
        }),
        _drawerTileWidget(FontAwesomeIcons.star, Strings.rateUs, onTap: () {
          // launch("");
        })
      ],
    );
  }

  _drawerTileWidget(icon, title, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: Row(
              crossAxisAlignment: crossStart,
              mainAxisAlignment: mainStart,
              children: [
                Icon(icon),
                addHorizontalSpace(Dimensions.widthSize * 1.5),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: Dimensions.mediumTextSize,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.textColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: CustomColor.borderColor.withOpacity(0.5),
          )
        ],
      ),
    );
  }

  _signOutButton(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 11),
        child: Row(
          crossAxisAlignment: crossCenter,
          mainAxisAlignment: mainStart,
          children: [
            const Icon(
              FontAwesomeIcons.signOut,
            ),
            addHorizontalSpace(Dimensions.widthSize * 1.2),
            Text(
              Strings.signOut,
              style: TextStyle(
                fontSize: Dimensions.mediumTextSize,
                fontWeight: FontWeight.w700,
                color: CustomColor.textColor,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Get.toNamed(Routes.signInScreen);
      },
    );
  }
}
