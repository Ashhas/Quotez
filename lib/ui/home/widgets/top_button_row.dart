import 'package:flutter/material.dart';
import 'package:quotez/utils/constants/ui_const.dart';

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
              Navigator.pushNamed(
                context,
                UiConst.savedQuotesScreenRoute,
              );
            },
            child: Icon(
              Icons.favorite_border,
              color: Theme.of(context).iconTheme.color,
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
              color: Theme.of(context).iconTheme.color,
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
