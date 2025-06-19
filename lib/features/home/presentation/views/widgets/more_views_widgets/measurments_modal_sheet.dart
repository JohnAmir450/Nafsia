import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/models/measurment_model.dart';
import 'package:nafsia/core/utils/app_text_styles.dart';
import 'package:nafsia/core/widgets/custom_animated_loading_widget.dart';
import 'package:nafsia/features/home/manager/more_cubit/more_cubit.dart';

class UserMeasurementsModalSheet extends StatelessWidget {
  const UserMeasurementsModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<MoreCubit, MoreState>(
        builder: (context, state) {
          if (state is GetUserMeasurementsLoadingState) {
            return const Center(child: CustomAnimatedLoadingWidget());
          }

          if (state is GetUserMeasurementsFailureState) {
            return Center(
              child: Text(
                'حدث خطأ: ${state.errorMessage}',
                style: TextStyles.semiBold16,
              ),
            );
          }

          if (state is GetUserMeasurementsSuccessState) {
            final List<MeasurementModel> measurements = state.measurements.reversed.toList();

            if (measurements.isEmpty) {
              return const Center(child: Text('لا توجد قياسات محفوظة.'));
            }

            return ListView.separated(
              itemCount: measurements.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final m = measurements[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  shadowColor: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('المهنة: ${m.occupation}', style: TextStyles.semiBold16),
                        const SizedBox(height: 12),
                        _buildStat(icon: Icons.person, label: 'الجنس', value: m.gender),
                        _buildStat(icon: Icons.monitor_heart, label: 'BMI', value: m.bmiCategory),
                        _buildStat(icon: Icons.monitor, label: 'الضغط الانقباضي', value: '${m.systolicBp}'),
                        _buildStat(icon: Icons.monitor, label: 'الضغط الانبساطي', value: '${m.diastolicBp}'),
                        _buildStat(icon: Icons.favorite, label: 'ضربات القلب', value: '${m.heartRate}'),
                        _buildStat(icon: Icons.self_improvement, label: 'مستوى التوتر', value: '${m.stressLevel}'),
                        _buildStat(icon: Icons.bedtime, label: 'جودة النوم', value: '${m.sleepQuality}'),
                        _buildStat(icon: Icons.directions_walk, label: 'الخطوات اليومية', value: '${m.dailySteps}'),
                        _buildStat(icon: Icons.cake, label: 'السن', value: '${m.age}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink(); // fallback for unknown state
        },
      ),
    );
  }

  Widget _buildStat({required IconData icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.teal),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
