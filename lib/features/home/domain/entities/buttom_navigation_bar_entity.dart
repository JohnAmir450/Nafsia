import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/app_images.dart';


class ButtonNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String Function(BuildContext) name; // Change to function returning a localized string

  ButtonNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<ButtonNavigationBarEntity> buttonNavigationBarEntityList = [
  ButtonNavigationBarEntity(
    name: (context) =>'الرئيسية', // Use localized text
    activeImage: Assets.assetsImagesHomeActive,
    inActiveImage: Assets.assetsImagesHomeInactive,
  ),
  ButtonNavigationBarEntity(
    name: (context) =>'المحادثات',
    activeImage: Assets.assetsImagesChatsActive,
    inActiveImage: Assets.assetsImagesChatsInactive,
  ),
  ButtonNavigationBarEntity(
    name: (context) =>'مجموعات الدعم',
    activeImage: Assets.assetsImagesGroupChatsActive,
    inActiveImage: Assets.assetsImagesGroupChatsInactive,
  ),
  ButtonNavigationBarEntity(
    name: (context) => 'المزيد',
    activeImage: Assets.assetsImagesMoreActive,
    inActiveImage: Assets.assetsImagesMoreInactive,
  ),
];