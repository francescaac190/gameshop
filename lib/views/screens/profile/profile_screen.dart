import 'package:flutter/material.dart';
import 'package:gameshop/routes/routes.dart';
import 'package:gameshop/utils/assets.dart';
import 'package:gameshop/utils/custom_style.dart';
import 'package:gameshop/utils/dimensions.dart';
import 'package:gameshop/utils/strings.dart';
import 'package:gameshop/widgets/others/custom_appbar.dart';
import 'package:gameshop/widgets/others/svg_icon.dart';
import 'package:get/get.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.profile),
      backgroundColor: CustomColor.primaryBackgroundColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 2.5),
          child: Column(
            children: [
              _userInformation(context),
              _currentBalance(context),
              _otherWidget(context),
            ],
          ),
        ),
      ],
    );
  }

  _userInformation(BuildContext context) {
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
                  image: DecorationImage(image: AssetImage(StaticAssets.profilePic),
                      fit: BoxFit.cover)
              ),
              // child: Image.asset(StaticAssets.freeFireINCODE, fit: BoxFit.fill,),
            )
        ),
      ),
    );
  }

  _userTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 2.5),
      child: Column(
        children: [
          Text(
            Strings.userName,
            style: TextStyle(
              fontSize: Dimensions.profileNameTextSize,
              fontWeight: FontWeight.w600,
              color: CustomColor.textColor,
            ),
          ),
          Text(
            Strings.userGmail,
            style: CustomStyle.defaultSubTitleStyle,
          ),
        ],
      ),
    );
  }

  _currentBalance(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.widthSize * 2.9),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.widthSize * 2),
      height: Dimensions.heightSize * 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius),
        color: const Color(CustomColor.five),
      ),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          Column(
            mainAxisAlignment: mainCenter,
            crossAxisAlignment: crossStart,
            children: [
              Text(
                '1000.00 USD',
                style: CustomStyle.defaultTitleStyle,
              ),
              Text(
                Strings.currentBalance,
                style: CustomStyle.defaultSubTitleStyle,
              ),
            ],
          ),
          InkWell(
            child: SvgIcon(
              asset: StaticAssets.add,
              height: 38,
              width: 38,
            ),
            onTap: () {
              Get.toNamed(Routes.addMoneyScreen);
            },
          )
        ],
      ),
    );
  }

  _otherWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 5),
      child: Column(
        children: [
          _profileTile(
            StaticAssets.editProfile,
            Strings.editProfile,
            onTap: () {
              Get.toNamed(Routes.editProfileScreen);
            },
          ),
          Divider(color: CustomColor.borderColor.withOpacity(0.5)),
          _profileTile(
            StaticAssets.password,
            Strings.changePassword,
            onTap: () {
              Get.toNamed(Routes.changePasswordScreen);
            },
          ),
        ],
      ),
    );
  }

  _profileTile(icon, title, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 34),
        child: Row(
          crossAxisAlignment: crossCenter,
          children: [
            SvgIcon(
              height: 20,
              width: 20,
              asset: icon,
              color: CustomColor.secondaryColor,
            ),
            addHorizontalSpace(14),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: CustomColor.secondaryColor,
              ),
            ),
            const Spacer(),
            SvgIcon(
              height: 25,
              width: 25,
              asset: StaticAssets.forward,
            ),
          ],
        ),
      ),
    );
  }
}
