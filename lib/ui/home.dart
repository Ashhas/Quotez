import 'package:flutter/material.dart';
import 'package:quotez/ui/widgets/action_button_row.dart';
import 'package:quotez/ui/widgets/text_container.dart';
import 'package:quotez/ui/widgets/top_button_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFf7f7f7),
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
    return Align(
      alignment: Alignment.topRight,
      child: TopButtonRow(),
    );
  }

  Widget textWidget() {
    return TextContainer();
  }

  Widget actionRowWidget() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: (MediaQuery.of(context).size.height) * 0.05),
      child: ActionButtonRow(),
    );
  }
}
