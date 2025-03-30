import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_app_bar.dart';
import 'package:nafsia/core/widgets/custom_text_field.dart';
import 'package:nafsia/features/home/manager/mood_cubit/mood_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/custom_fetch_moods_button.dart';
import 'package:nafsia/features/home/presentation/views/widgets/moods_list.dart';
import 'package:nafsia/features/home/presentation/views/widgets/save_mood_button_bloc_consumer.dart';

class MoodSelectionScreen extends StatefulWidget {
  const MoodSelectionScreen({super.key});

  @override
  State<MoodSelectionScreen> createState() => _MoodSelectionScreenState();
}

class _MoodSelectionScreenState extends State<MoodSelectionScreen> {
  String? selectedMood;
  final TextEditingController notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoodCubit(),
      child: Scaffold(
        appBar: buildAppBar(
          actions: [const CustomFetchMoodsButton()],
          context,
          onTap: () => context.pop(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(12),
              Text(
                'كيف تشعر اليوم؟',
                style: TextStyles.bold16.copyWith(color: Colors.black),
              ),
              verticalSpace(8),
              Text(
                'ساعد نفسك في انك تعرف انت حاسس ب ايه دلوقت ومحدش هيقدر ومحدش هيقدر يشوف ده غيرك.',
                style: TextStyles.regular14.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              verticalSpace(16),
              MoodsList(
                selectedMood: selectedMood,
                onMoodSelected: (mood) => setState(() => selectedMood = mood),
              ),
              const Spacer(),
              Visibility(
                visible: selectedMood != null,
                child: CustomTextFormField(
                  hintText: 'اكتب ملاحظاتك',
                  maxLines: 5,
                  labelText: 'طلع اللي جواك هنا',
                  needsValidation: false,
                  controller: notesController,
                ),
              ),
              verticalSpace(16),
              SaveMoodButton(
                selectedMood: selectedMood,
                notesController: notesController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
