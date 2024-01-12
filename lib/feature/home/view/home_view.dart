import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/view/widget/custom_app_bar.dart';

import '../../../core/component/icon/lottie_icon.dart';
import '../../../core/extension/context_extension.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/utility/enum/lottie_items.dart';
import '../../../product/widget/text/topic_title_text.dart';
import '../view-model/home/index.dart';
import 'mixin/home_view_mixin.dart';
import 'widget/index.dart';

part 'home_view.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            appBar: CustomAppBar(),
            body: Center(
              child: LottieIcon(
                item: LottieItems.loading,
              ),
            ),
          );
        } else if (state.isCompleted) {
          return const Scaffold(
            appBar: CustomAppBar(),
            body: _MovieLists(),
          );
        } else {
          final error = state.errorMessage;
          return Text(error);
        }
      },
    );
  }
}
