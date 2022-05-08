import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/ui/home/widgets/about_panel.dart';
import 'package:quotez/ui/home/widgets/home_content.dart';
import 'package:quotez/ui/home/widgets/home_footer.dart';
import 'package:quotez/ui/home/widgets/home_header.dart';
import 'package:quotez/ui/home/widgets/home_no_network_widget.dart';

/// [HomeScreen] is the main screen of the app, containing most of the content
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PanelController panelController = PanelController();

  @override
  void initState() {
    super.initState();
    panelController.isAttached ? panelController.hide() : null;
    BlocProvider.of<HomeCubit>(context).getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SlidingUpPanel(
        controller: panelController,
        // maxHeight: MediaQuery.of(context).size.height * 0.52,
        minHeight: 0,
        backdropEnabled: true,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(18),
        ),
        // panel: const AboutPanel(),
        panelBuilder: (ScrollController sc) => AboutPanel(scrollController: sc),
        body: SafeArea(
          child: Column(
            children: [
              HomeHeader(panelController: panelController),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (BuildContext context, state) {
                  if (state is HomeNoNetwork) {
                    return const HomeNoNetworkWidget();
                  } else {
                    return Expanded(
                      child: Column(
                        children: const [
                          HomeContent(),
                          HomeFooter(),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
