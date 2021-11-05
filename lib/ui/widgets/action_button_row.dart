import 'package:flutter/material.dart';
import 'package:quotez/ui/widgets/quote_button.dart';
import 'package:quotez/ui/widgets/share_button.dart';

import 'favorite_button.dart';

class ActionButtonRow extends StatefulWidget {
  const ActionButtonRow({Key? key}) : super(key: key);

  @override
  _ActionButtonRowState createState() => _ActionButtonRowState();
}

class _ActionButtonRowState extends State<ActionButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        FavoriteButton(),
        QuoteButton(),
        ShareButton(),
      ],
    );
  }
}
