import 'dart:developer';

import 'package:share_plus/share_plus.dart';

import 'package:quotez/data/model/quote.dart';
import 'package:quotez/utils/ui_strings.dart';

/// [ShareUtil] Handles sharing messages in different formats.
abstract class ShareUtil {
  /// [shareQuote] uses [Share] to start sharing a constructed [String] value.
  static void shareQuote(Quote? quote) {
    try {
      Share.share("\"${quote?.value}\"\n - ${quote?.author}");
    } catch (e) {
      log(UiStrings.shareError);
    }
  }
}
