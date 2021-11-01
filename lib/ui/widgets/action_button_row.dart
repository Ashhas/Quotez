import 'package:flutter/material.dart';

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
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            size: 25,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Center(
            child: Icon(
              Icons.sync,
              size: 35,
            ),
          ),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(80, 80),
            primary: Theme.of(context).primaryColor,
            shape: const CircleBorder(
              side: BorderSide.none,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.share,
            size: 25,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ],
    );
  }
}
