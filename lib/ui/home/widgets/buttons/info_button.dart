import 'package:flutter/material.dart';

import 'package:quotez/utils/constants/ui_const.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({
    Key? key,
    this.function,
  }) : super(key: key);

  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Icon(
        Icons.info_outline,
        color: Theme.of(context).iconTheme.color,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        textStyle: const TextStyle(fontSize: 15),
      ),
    );
  }
}
