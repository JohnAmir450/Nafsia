import 'package:hive/hive.dart';
part 'mood_model.g.dart';

@HiveType(typeId: 0)
class MoodModel extends HiveObject{
  @HiveField(0)
  final String selectedMood;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final String notes;

  MoodModel({
    required this.selectedMood,
    required this.date,
    required this.notes,
  });
}
