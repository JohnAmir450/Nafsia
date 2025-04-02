import 'package:flutter/material.dart';
import 'package:nafsia/core/utils/constants.dart';
import 'package:nafsia/core/utils/spacing.dart';
import 'package:nafsia/core/widgets/custom_post_item.dart';
import 'package:nafsia/features/home/presentation/views/widgets/custom_home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding, vertical: kVerticalPadding),
          child: CustomHomeAppBar(),
        )),
        SliverToBoxAdapter(
          child: verticalSpace(16),
        ),
        SliverList.builder(
          itemBuilder: (context, index) => const CustomPostItem(),
          itemCount: 10,
        )
      ],
    );
  }
}
