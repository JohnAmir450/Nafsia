import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/features/home/manager/mood_cubit/mood_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/empty_moods_list.dart';
import 'package:nafsia/features/home/presentation/views/widgets/mood_list_tile_item.dart';

class CustomFetchMoodsButton extends StatelessWidget {
  const CustomFetchMoodsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showMoodHistoryModal(context),
      icon: const Icon(Icons.calendar_today),
    );
  }
}

void _showMoodHistoryModal(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => MoodCubit()..fetchAllUserMoods(),
      child: BlocBuilder<MoodCubit, MoodState>(
        builder: (context, state) {
          var notes = context.watch<MoodCubit>().moodsList ?? [];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: notes.isEmpty
                ? const EmptyMoodsList()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final reversedNotes = notes.reversed.toList();
                      return MoodListItem(
                        moodItem: reversedNotes[index],
                        onDelete: () {
                          context
                              .read<MoodCubit>()
                              .deleteMood(reversedNotes[index]);
                        },
                      );
                    },
                  ),
          );
        },
      ),
    ),
  );
}
