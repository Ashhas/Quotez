import 'dart:developer';

import 'package:share_plus/share_plus.dart';

import '../data/model/quote.dart';
import 'constants/ui_const.dart';

/// [ShareUtil] Handles sharing messages in different formats
class ShareUtil {
  ShareUtil._();

  /// [shareQuote] uses [Share] to start sharing a constructed [String] value
  static void shareQuote(Quote? quote) {
    try {
      Share.share("\"${quote?.value}\"\n - ${quote?.author}");
    } catch (e) {
      log(UiConst.shareError);
    }
  }
}
