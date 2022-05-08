import 'package:url_launcher/url_launcher.dart';

/// [UrlUtil] is an util used to handle opening Website URLs.
abstract class UrlUtil {
  /// [openUrl] Method to open URLs in external web-browser.
  /// Accepts URL in [String] Format
  static openUrl(String url) {
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }
}
