import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/ui/home/widgets/home_content.dart';
import 'package:quotez/ui/home/widgets/home_footer.dart';
import 'package:quotez/ui/home/widgets/home_header.dart';
import 'package:quotez/ui/home/widgets/home_no_network_widget.dart';

/// [HomeScreen]
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          children: [
            const HomeHeader(),
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
    );
  }
}
