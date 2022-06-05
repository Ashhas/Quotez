import 'package:flutter/material.dart';

import 'package:quotez/theme/app_dimens.dart';

/// [PanelHeader] Element used at the top of the panel.
class PanelHeader extends StatelessWidget {
  const PanelHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.paddingM,
      ),
      child: Container(
        width: AppDimens.sizeUnitM,
        height: AppDimens.sizeUnitS,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimens.borderRadiusM,
            ),
          ),
        ),
      ),
    );
  }
}
