import 'package:flutter/material.dart';

import 'package:quotez/utils/ui_strings.dart';

/// [BookmarkStorageButton] navigates to [SavedQuotesScreen] on-pressed.
class BookmarkStorageButton extends StatelessWidget {
  const BookmarkStorageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          UiStrings.savedQuotesScreenRoute,
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
    );
  }
}
