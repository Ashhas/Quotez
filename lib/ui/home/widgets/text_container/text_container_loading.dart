import 'package:flutter/material.dart';

import 'package:shimmer_animation/shimmer_animation.dart';

import 'package:quotez/theme/app_dimens.dart';

/// Shimmer Widget when [HomeState] is in the [HomeLoading] state.
class TextContainerLoading extends StatelessWidget {
  const TextContainerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppDimens.paddingXL,
        left: AppDimens.paddingXL,
        top:
            (MediaQuery.of(context).size.height) * AppDimens.paddingPercentageM,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Shimmer(
            color: Colors.grey.shade900,
            child: const SizedBox(
              height: AppDimens.shimmerHeight,
              width: AppDimens.shimmerWidthL,
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height) *
                AppDimens.sizeUnitPercentageS,
          ),
          Shimmer(
            color: Colors.grey.shade900,
            child: const SizedBox(
              height: AppDimens.shimmerHeight,
              width: AppDimens.shimmerWidthM,
            ),
          ),
        ],
      ),
    );
  }
}
