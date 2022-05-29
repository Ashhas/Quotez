import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:open_mail_app/open_mail_app.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:quotez/ui/home/widgets/panel_widgets/panel_divider.dart';
import 'package:quotez/ui/home/widgets/panel_widgets/panel_header.dart';
import 'package:quotez/ui/home/widgets/panel_widgets/panel_list_tile.dart';
import 'package:quotez/utils/constants/ui_const.dart';
import 'package:quotez/utils/constants/var_const.dart';
import 'package:quotez/utils/url_launcher_util.dart';

/// [AboutPanel] displays information about the app and extra communication
class AboutPanel extends StatefulWidget {
  final ScrollController? scrollController;

  const AboutPanel({
    this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  State<AboutPanel> createState() => _AboutPanelState();
}

class _AboutPanelState extends State<AboutPanel> {
  PackageInfo? appInfo;

  Future<PackageInfo> initPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }

  /// Try and send an email using the [open_mail_app] package
  Future<void> sendEmail() async {
    final result = await OpenMailApp.composeNewEmailInMailApp(
      emailContent: EmailContent(
        to: [VarConst.developerEmail],
        subject: VarConst.emailSubjectTemplate,
      ),
    );

    // If no mail apps found, show error
    if (!result.didOpen && !result.canOpen) {
      log(UiConst.noEmailApp);
      // iOS: if multiple mail apps found, show dialog to select.
      // There is no native intent/default app system in iOS so
      // you have to do it yourself.
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
        context: context,
        builder: (_) {
          return MailAppPickerDialog(
            mailApps: result.options,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    initPackageInfo().then((packageInfo) {
      setState(() {
        appInfo = packageInfo;
      });
    });

    return SingleChildScrollView(
      controller: widget.scrollController,
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
        ),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              const PanelHeader(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 10),
                        child: CircleAvatar(
                          radius: 70,
                          foregroundImage: AssetImage(
                            "assets/app_icon.png",
                          ),
                        ),
                      ),
                      const Text(UiConst.appName),
                      Text('v${appInfo?.version}'),
                      const SizedBox(height: 30),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const PanelDivider(),
                      PanelListTile(
                        title: UiConst.githubRepoTitle,
                        tileIcon: const Icon(Icons.code),
                        onTap: () async {
                          UrlUtil.openUrl(VarConst.githubRepositoryUrl);
                        },
                      ),
                      const PanelDivider(),
                      PanelListTile(
                        title: UiConst.writeMeAnEmail,
                        tileIcon: const Icon(Icons.mail_outline),
                        onTap: () => sendEmail(),
                      ),
                      const PanelDivider(),
                      PanelListTile(
                        title: UiConst.rateTheApp,
                        tileIcon: const Icon(Icons.rate_review_outlined),
                        onTap: () {},
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
