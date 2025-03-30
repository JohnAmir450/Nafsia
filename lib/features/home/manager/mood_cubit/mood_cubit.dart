import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:nafsia/core/utils/constants.dart';
import 'package:nafsia/features/home/domain/models/mood_model.dart';

part 'mood_state.dart';

class MoodCubit extends Cubit<MoodState> {
  MoodCubit() : super(MoodInitialState());
  List<MoodModel>? moodsList;
  addMood(MoodModel moodModel) async {
    emit(MoodLoadingState());
    try {
      var moodBox = Hive.box<MoodModel>(kMoodBox);
      await moodBox.add(moodModel);
      emit(AddMoodSuccessState());
    } catch (e) {
      emit(MoodFailureState(errorMessage: e.toString()));
    }
  }

  fetchAllUserMoods() async {
    var moodBox = Hive.box<MoodModel>(kMoodBox);
    moodsList = moodBox.values.toList();
  }

   void deleteMood(MoodModel mood) {
    moodsList?.remove(mood);
      emit(AddMoodSuccessState());
  }
}
