import 'package:flutter/material.dart';

class TopButtonRow extends StatefulWidget {
  const TopButtonRow({Key? key}) : super(key: key);

  @override
  _TopButtonRowState createState() => _TopButtonRowState();
}

class _TopButtonRowState extends State<TopButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/saved_quotes_screen");
            },
            child: Icon(
              Icons.favorite_border,
              color: Colors.black45,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              textStyle: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            child: Icon(
              Icons.settings,
              color: Colors.black45,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              textStyle: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
