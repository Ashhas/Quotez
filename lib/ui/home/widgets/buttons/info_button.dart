import 'package:flutter/material.dart';

import 'package:quotez/ui/home/widgets/about_panel.dart';

/// [InfoButton] opens up the [AboutPanel] when pressed.
class InfoButton extends StatelessWidget {
  const InfoButton({
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
