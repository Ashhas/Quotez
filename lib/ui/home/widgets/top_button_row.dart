import 'package:flutter/material.dart';
import 'package:quotez/utils/constants/ui_const.dart';

///Row Widget for extra navigation destinations
class TopButtonRow extends StatefulWidget {
  const TopButtonRow({Key? key}) : super(key: key);

  @override
  _TopButtonRowState createState() => _TopButtonRowState();
}

class _TopButtonRowState extends State<TopButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 10),
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
              Icons.bookmarks,
              color: Theme.of(context).iconTheme.color,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
