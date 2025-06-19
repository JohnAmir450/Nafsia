import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nafsia/core/utils/custom_snak_bar.dart';
import 'package:nafsia/core/widgets/custom_animated_loading_widget.dart';
import 'package:nafsia/features/home/manager/home_cubit/home_cubit.dart';

class DoctorRatingModal extends StatefulWidget {
  final String doctorId;
  const DoctorRatingModal({super.key, required this.doctorId});

  @override
  State<DoctorRatingModal> createState() => _DoctorRatingModalState();
}

class _DoctorRatingModalState extends State<DoctorRatingModal> {
  double rating = 3.0;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets, // handles keyboard overlap
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          runSpacing: 20,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Center(
              child: Text(
                'تقييم الطبيب',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              glow: false,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (value) => setState(() => rating = value),
            ),
            TextField(
              controller: reviewController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'اكتب تعليقك',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is AddReviewFailureState) {
                  showSnackBar(context, text: state.errorMessage);
                } else if (state is AddReviewSuccessState) {
                  showSnackBar(context, text: 'تم التقييم بنجاح');
                }
              },
              builder: (context, state) {
                return state is AddReviewLoadingState
                    ? const Center(
                        child: CustomAnimatedLoadingWidget(),
                      )
                    : ElevatedButton.icon(
                        onPressed: () async {
                          await context.read<HomeCubit>().addDoctorReview(
                              doctorId: widget.doctorId,
                              review: reviewController.text,
                              rating: rating);
                          // Close modal
                        },
                        icon: const Icon(Icons.send),
                        label: const Text('إرسال التقييم'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
