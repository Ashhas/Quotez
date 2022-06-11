import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/bloc/home_screen/home_cubit.dart';
import 'package:quotez/theme/app_dimens.dart';
import 'package:quotez/utils/share_util.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return IconButton(
          onPressed: () {
            if (state is HomeLoaded) {
              ShareUtil.shareQuote(state.randomQuote);
            }
          },
          icon: Icon(
            Icons.share,
            size: AppDimens.iconSizeM,
            color: Theme.of(context).iconTheme.color,
          ),
        );
      },
    );
  }
}
