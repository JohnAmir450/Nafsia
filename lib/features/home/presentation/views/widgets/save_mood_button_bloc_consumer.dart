import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/utils/app_colors.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/widgets/custom_button.dart';
import 'package:nafsia/features/home/domain/models/mood_model.dart';
import 'package:nafsia/features/home/manager/mood_cubit/mood_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/custom_bottom_navigation_bar_decoration.dart';

class SaveMoodButton extends StatelessWidget {
  final String? selectedMood;

  final TextEditingController notesController;
  const SaveMoodButton(
      {super.key, required this.selectedMood, required this.notesController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoodCubit, MoodState>(
      listener: (context, state) {
        if (state is AddMoodSuccessState) {
          showSnackBar(context, text: 'تم الحفظ بنجاح',color: AppColors.primaryColor);
        } else if (state is MoodFailureState) {
          showSnackBar(context, text: state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomBottomNavigationBarDecoration(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: CustomButton(
              backgroundColor:
                  selectedMood == null ? Colors.grey : AppColors.primaryColor,
              text: 'حفظ',
              onPressed: selectedMood == null
                  ? null
                  : () {
                      context.read<MoodCubit>().addMood(MoodModel(
                            date: DateTime.now(),
                            selectedMood: selectedMood!,
                            notes: notesController.text,
                          ));
                    },
            ),
          ),
        );
      },
    );
  }
}
