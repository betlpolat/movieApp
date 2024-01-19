import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';

import '../../../core/extension/context_extension.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/widget/text/topic_title_text.dart';
import '../view-model/home/index.dart';
import 'mixin/home_view_mixin.dart';
import 'widget/custom_app_bar.dart';
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
        if (state.onLoad) {
          return Scaffold(
            appBar: const CustomAppBar(),
            body: Center(
              child: Assets.lottie.lottieLoading.lottie(
                package: 'gen',
              ),
            ),
          );
        } else if (state.onComplete) {
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
