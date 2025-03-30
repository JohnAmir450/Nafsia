import 'package:nafsia/core/utils/app_images.dart';

class MoodItemEntity{
  final String title;
  final String image;

  MoodItemEntity({required this.title, required this.image});
}
List<MoodItemEntity>  moodEntityList = [
  MoodItemEntity(title: 'سعيد', image: Assets.assetsImagesHappyEmoji),
  MoodItemEntity(title: 'خائف', image: Assets.assetsImagesScaredEmoji),
  MoodItemEntity(title: 'غاضب', image: Assets.assetsImagesAngryEmoji),
  MoodItemEntity(title: 'حزين', image: Assets.assetsImagesSadEmoji),
  MoodItemEntity(title: 'غير مرتاح', image: Assets.assetsImagesUncomfortableEmoji),
];