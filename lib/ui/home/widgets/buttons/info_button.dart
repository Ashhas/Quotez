import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({
    Key? key,
    this.onPressed,
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
