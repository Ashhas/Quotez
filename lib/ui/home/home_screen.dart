import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/ui/home/widgets/buttons/bookmark_storage_button.dart';
import 'package:quotez/ui/home/widgets/buttons/info_button.dart';
import 'package:quotez/ui/home/widgets/home_content.dart';
import 'package:quotez/ui/home/widgets/home_footer.dart';
import 'package:quotez/ui/home/widgets/home_no_network_widget.dart';

/// [HomeScreen]
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
        backdropEnabled: true,
        panel: const Center(
          child: Text("This is the sliding Widget"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: InfoButton(
                        function: () {
                          panelController.open();
                        },
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, right: 10),
                      child: BookmarkStorageButton(),
                    ),
                  ),
                ],
              ),
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
