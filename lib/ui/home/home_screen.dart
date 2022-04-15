import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/ui/home/widgets/home_footer.dart';
import 'package:quotez/ui/home/widgets/home_header.dart';
import 'package:quotez/ui/home/widgets/text_container/text_container.dart';
import 'package:quotez/ui/home/widgets/text_container/text_container_loading.dart';

/// [HomeScreen]
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HomeHeader(),
            textWidget(),
            const HomeFooter(),
          ],
        ),
      ),
    );
  }

  Widget textWidget() {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (BuildContext context, state) {
              if (state is HomeLoaded) {
                return TextContainer(randomQuote: state.randomQuote!);
              } else {
                return const TextContainerLoading();
              }
            },
          ),
        ),
      ),
    );
  }
}
