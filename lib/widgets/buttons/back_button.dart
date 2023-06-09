import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gameshop/utils/assets.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(left: Dimensions.marginSize),
      child: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: SvgPicture.asset(
        StaticAssets.backward,
          height: 29,
          width: 29,                      
        ),
      ),
    );
  }
}
