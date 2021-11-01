import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotez/bloc/home_screen/home_bloc.dart';
import 'package:quotez/ui/widgets/action_button_row.dart';
import 'package:quotez/ui/widgets/text_container.dart';
import 'package:quotez/ui/widgets/text_container_loading.dart';
import 'package:quotez/ui/widgets/top_button_row.dart';

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
    BlocProvider.of<HomeBloc>(context).add(GetRandomQuote());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        extendBodyBehindAppBar: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topRowWidget(),
            textWidget(),
            actionRowWidget(),
          ],
        ),
      ),
    );
  }

  Widget topRowWidget() {
    return const Align(
      alignment: Alignment.topRight,
      child: TopButtonRow(),
    );
  }

  Widget textWidget() {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, state) {
      if (state is HomeLoading) {
        return const TextContainerLoading();
      } else if (state is HomeLoaded) {
        return TextContainer(randomQuote: state.randomQuote);
      } else {
        return Container();
      }
    });
  }

  Widget actionRowWidget() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: (MediaQuery.of(context).size.height) * 0.05),
      child: const ActionButtonRow(),
    );
  }
}
