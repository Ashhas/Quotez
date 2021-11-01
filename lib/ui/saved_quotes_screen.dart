import 'package:flutter/material.dart';

class SavedQuotesScreen extends StatefulWidget {
  const SavedQuotesScreen({Key? key}) : super(key: key);

  @override
  _SavedQuotesScreenState createState() => _SavedQuotesScreenState();
}

class _SavedQuotesScreenState extends State<SavedQuotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Quotes"),
      ),
      body: Container(),
    );
  }
}
