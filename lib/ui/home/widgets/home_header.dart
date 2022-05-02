import 'package:flutter/material.dart';

import 'package:quotez/ui/home/widgets/buttons/info_button.dart';
import 'buttons/bookmark_storage_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: InfoButton(),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 5, right: 10),
            child: BookmarkStorageButton(),
          ),
        ),
      ],
    );
  }
}
