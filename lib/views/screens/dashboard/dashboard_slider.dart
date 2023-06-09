// ignore_for_file: use_key_in_widget_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/assets.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';

final List<String> imgList = [
  StaticAssets.sliderImg,
  StaticAssets.sliderImg,
  StaticAssets.sliderImg,
  StaticAssets.sliderImg,
  StaticAssets.sliderImg,
];

class DashBoardSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashBoardSliderState();
  }
}

class _DashBoardSliderState extends State<DashBoardSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CarouselSlider(
          items: imgList.map((img) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high),
                  ),
                );
              },
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _current = index; //! Custom Dot indicator State
              });
            },
            height: 260,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 7),
            autoPlayAnimationDuration: const Duration(seconds: 2),
            scrollDirection: Axis.horizontal,
          ),
        ),
        Container(
          //! Custom Dot indicator Start
          margin: EdgeInsets.only(
            top: Dimensions.heightSize,
            bottom: Dimensions.heightSize * 2.6,
          ),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return _current == entry.key
                  ? Container(
                      width: Dimensions.widthSize,
                      height: Dimensions.heightSize * 0.7,
                      margin: EdgeInsets.symmetric(horizontal: h * 0.006),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColor.primaryColor,
                      ))
                  : Container(
                      width: Dimensions.widthSize,
                      height: Dimensions.heightSize * 0.7,
                      margin: EdgeInsets.symmetric(horizontal: h * 0.006),
                      decoration: BoxDecoration(
                        color: CustomColor.textColor.withOpacity(0.30),
                        shape: BoxShape.circle,
                      ),
                    );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
