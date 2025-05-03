import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafsia/core/helper_functions/extentions.dart';
import 'package:nafsia/core/services/get_it_service.dart';
import 'package:nafsia/core/widgets/custom_app_bar.dart';
import 'package:nafsia/features/home/domain/repos/home_repo.dart';
import 'package:nafsia/features/home/manager/home_cubit/home_cubit.dart';
import 'package:nafsia/features/home/presentation/views/widgets/more_views_widgets/saved_posts_view_body.dart';

class SavedPostsView extends StatelessWidget {
  const SavedPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>())..getSavedPosts(),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'العناصر المحفوظة',
          onTap: () => context.pop(),
        ),
        body: const SavedPostsViewBody(),
      
      ),
    );
  }
}
