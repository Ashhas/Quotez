import 'package:flutter/material.dart';

class TextContainer extends StatefulWidget {
  const TextContainer({Key? key}) : super(key: key);

  @override
  _TextContainerState createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 30,
        left: 30,
        top: (MediaQuery.of(context).size.height) * 0.1,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "“In software, we rarely have meaningful requirements. Even if we do, the only measure of success that matters is whether our solution solves the customer’s shifting idea of what their problem is.”",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height) * 0.06,
          ),
          Text("— Jeff Atwood"),
        ],
      ),
    );
  }
}
