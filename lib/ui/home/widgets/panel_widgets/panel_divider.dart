import 'package:flutter/material.dart';

/// Standard divider used in the panels.
class PanelDivider extends StatelessWidget {
  const PanelDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0.5,
      thickness: 0.5,
    );
  }
}
