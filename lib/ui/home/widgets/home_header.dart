import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:quotez/theme/app_dimens.dart';
import 'package:quotez/ui/home/widgets/buttons/info_button.dart';
import 'buttons/bookmark_storage_button.dart';

/// [HomeHeader] is the header of the home-screen containing the navigation buttons.
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    required this.panelController,
    Key? key,
  }) : super(key: key);

  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppDimens.paddingM,
              top: AppDimens.paddingS,
            ),
            child: InfoButton(
              onPressed: () => panelController.open(),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(
              top: AppDimens.paddingS,
              right: AppDimens.paddingM,
            ),
            child: BookmarkStorageButton(),
          ),
        ),
      ],
    );
  }
}
