import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

/// Shimmer Widget when [HomeState] is [HomeLoading]
class TextContainerLoading extends StatefulWidget {
  const TextContainerLoading({Key? key}) : super(key: key);

  @override
  _TextContainerState createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainerLoading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 30,
        left: 30,
        top: (MediaQuery.of(context).size.height) * 0.1,
      ),
      child: Column(
        children: [
          Shimmer(
            color: Colors.grey.shade900,
            child: const SizedBox(
              height: 20,
              width: 300,
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height) * 0.06,
          ),
          Shimmer(
            color: Colors.grey.shade900,
            child: const SizedBox(
              height: 20,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
