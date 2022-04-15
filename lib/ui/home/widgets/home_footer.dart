import 'package:flutter/material.dart';

import 'buttons/favorite_button.dart';
import 'buttons/quote_button.dart';
import 'buttons/share_button.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: (MediaQuery.of(context).size.height) * 0.04,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            FavoriteButton(),
            QuoteButton(),
            ShareButton(),
          ],
        ),
      ),
    );
  }
}
