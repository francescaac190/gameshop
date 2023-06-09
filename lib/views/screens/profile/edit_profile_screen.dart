// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gameshop/utils/custom_color.dart';
import 'package:gameshop/utils/dimensions.dart';
import 'package:gameshop/utils/strings.dart';
import 'package:gameshop/widgets/inputs/phone_number_input_textfield_widget.dart';
import 'package:gameshop/widgets/others/custom_appbar.dart';
import 'package:gameshop/widgets/inputs/input_field_widget.dart';
import 'package:get/get.dart';
import '../../../../widgets/buttons/primary_button_widget.dart';
import '../../../controller/profile/edit_profile_controller.dart';
import '../../../utils/assets.dart';
import '../../../widgets/others/svg_icon.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryBackgroundColor,
      appBar: CustomAppBar(Strings.editProfile),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
      child: ListView(
        children: [
          _imageWidget(context),
          _inputWidget(context),
          _updateButtonWidget(context),
        ],
      ),
    );
  }

  _imageWidget(BuildContext context) {
    return GetBuilder<EditProfileController>(
      assignId: true,
      builder: (logic) {
        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                controller.image == null
                    ? CircleAvatar(
                        radius: 82,
                        backgroundColor: CustomColor.editProfileCircleColor,
                        child: CircleAvatar(
                            radius: Dimensions.radius * 6.8,
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
                      )
                    : CircleAvatar(
                        radius: 82,
                        backgroundColor: CustomColor.editProfileCircleColor,
                        child: CircleAvatar(
                          radius: 75,
                          backgroundImage: FileImage(controller.image!),
                        ),
                      ),
                Positioned(
                  bottom: 14,
                  right: 12,
                  child: GestureDetector(
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: CustomColor.primaryBackgroundColor,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: CustomColor.editProfileCircleColor,
                        child: Center(
                            child: SvgIcon(
                          asset: StaticAssets.camera,
                          height: Dimensions.heightSize,
                          width: 10,
                        )),
                      ),
                    ),
                    onTap: () {
                      _openImageSourceOptions(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _inputWidget(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputFieldWidget(
            controller: controller.fullNameController,
            hintText: Strings.enterFullName,
            labelText: Strings.fullName,
            keyboardType: TextInputType.text,
          ),
          InputFieldWidget(
            controller: controller.emailController,
            hintText: Strings.enterEmail,
            labelText: Strings.email,
            keyboardType: TextInputType.emailAddress,
          ),
          PhoneNumberInputTextFieldWidget(
            controller: controller.phoneNumberController,
            hintText: Strings.mobileHint,
            labelText: Strings.mobile,
            keyboardType: TextInputType.number,
          )
        ],
      ),
    );
  }

  _updateButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 5),
      child: PrimaryButtonWidget(
        text: Strings.update,
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  _openImageSourceOptions(BuildContext context) {
    showGeneralDialog(
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.6),
        transitionDuration: const Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 150,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.camera_alt,
                            size: 40.0,
                            color: Colors.blue,
                          ),
                          onTap: () {
                            controller.chooseFromCamera();
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          'from Camera',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.smallTextSize),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.photo,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          onTap: () {
                            controller.chooseFromGallery();
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          'From Gallery',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.smallTextSize),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(anim),
            child: child,
          );
        });
  }
}
