import 'package:url_launcher/url_launcher.dart';

abstract class UrlUtil {
  static openUrl(String url) {
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }
}
