import 'package:flutter/material.dart';

import 'buttons/bookmark_storage_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(top: 5, right: 10),
        child: BookmarkStorageButton(),
      ),
    );
  }
}
