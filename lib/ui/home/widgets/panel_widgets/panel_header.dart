import 'package:flutter/material.dart';

/// Standard widget used at the top of the panel
class PanelHeader extends StatelessWidget {
  const PanelHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
