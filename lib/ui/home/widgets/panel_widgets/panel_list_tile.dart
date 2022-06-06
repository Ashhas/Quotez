import 'package:flutter/material.dart';

/// [PanelListTile] is the standard tile used in the panel.
class PanelListTile extends StatelessWidget {
  const PanelListTile({
    required this.title,
    this.tileIcon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final Icon? tileIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      enabled: true,
      horizontalTitleGap: 0,
      leading: tileIcon,
      title: Text(
        title,
        style: Theme.of(context).primaryTextTheme.bodyText2,
      ),
      onTap: onTap,
    );
  }
}
