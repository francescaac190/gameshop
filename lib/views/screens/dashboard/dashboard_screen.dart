import 'package:flutter/material.dart';
import 'package:gameshop/data/games_list.dart';
import 'package:gameshop/routes/routes.dart';
import 'package:gameshop/utils/assets.dart';
import 'package:gameshop/views/screens/dashboard/dashboard_slider.dart';
import 'package:gameshop/widgets/game%20card/game_card_widget.dart';
import 'package:get/get.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';

import '../drawer/custom_drawer_widget.dart';
import '../../../widgets/others/svg_icon.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
      drawer: const CustomDrawer(),
      appBar: _appBarWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        DashBoardSlider(),
        _gameWidget(context),
      ],
    );
  }

  _gameWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize * 0.8),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 3.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: gamesList.length,
        itemBuilder: (BuildContext context, int i) {
          return GameCardWidget(
            gameImage: gamesList[i].img,
            gameName: gamesList[i].title,
            onTap: () => Get.toNamed(gamesList[i].route, arguments: [
              gamesList[i].title,
            ]),
          );
        },
      ),
    );
  }

  _appBarWidget(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgIcon(
              asset: StaticAssets.menu,
              height: 13,
              width: 17,
            ));
      }),
      title: Text(
        Strings.dashboard,
        style: CustomStyle.defaultTitleStyle,
      ),
      actions: [
        IconButton(
            onPressed: () {
              Get.toNamed(Routes.profileScreen);
            },
            icon: SvgIcon(
              asset: StaticAssets.profile,
              height: 23,
              width: 23,
            )),
      ],
      elevation: 0,
      centerTitle: true,
      backgroundColor: CustomColor.appBarColor,
    );
  }
}
