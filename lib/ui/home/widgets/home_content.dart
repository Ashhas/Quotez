import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/ui/home/widgets/text_container/text_container.dart';
import 'package:quotez/ui/home/widgets/text_container/text_container_loading.dart';

/// [HomeContent] holds the main content widget of the home screen.
class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (BuildContext context, state) {
              return state is HomeLoaded
                  ? TextContainer(randomQuote: state.randomQuote!)
                  : const TextContainerLoading();
            },
          ),
        ),
      ),
    );
  }
}
