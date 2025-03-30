import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/helper_functions/foramted_date.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/features/home/domain/models/mood_model.dart';

class MoodListItem extends StatelessWidget {
  final MoodModel moodItem;
  final VoidCallback onDelete; // ✅ Pass a function to handle deletion

  const MoodListItem({super.key, required this.moodItem, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Slidable(
        key: ValueKey(moodItem.date), // ✅ Ensures correct item deletion
        endActionPane: ActionPane(
          motion: const DrawerMotion(), // ✅ Smooth slide effect
          children: [
            SlidableAction(
              onPressed: (context) => _confirmDelete(context),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'حذف',
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildListTile(
                icon: moodItem.selectedMood == "سعيد" ? Icons.mood : Icons.mood_bad,
                iconColor: moodItem.selectedMood == "سعيد" ? Colors.blue : Colors.red,
                title: 'الحالة: ${moodItem.selectedMood}',
              ),
              _buildListTile(
                icon: Icons.calendar_today,
                iconColor: Colors.green,
                title: 'التاريخ: ${formatDateFromDateTime(moodItem.date)}',
              ),
              if (moodItem.notes.isNotEmpty)
                _buildListTile(
                  icon: Icons.note,
                  iconColor: Colors.orange,
                  title: 'الملاحظات: ${moodItem.notes}',
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({required IconData icon, required Color iconColor, required String title}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyles.regular14.copyWith(color: Colors.black54),
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("حذف الحالة"),
        content: const Text("هل أنت متأكد أنك تريد حذف هذه الحالة؟"),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            
            child: const Text("إلغاء"),
          ),
          TextButton(
            onPressed: () {
                onDelete(); 
              context.pop();
              context.pop();
            },
            child: const Text("حذف", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
