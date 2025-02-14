import 'package:dupot_easy_flatpak/Localizations/app_localizations.dart';
import 'package:dupot_easy_flatpak/Screens/Shared/app_button.dart';
import 'package:dupot_easy_flatpak/Models/Flathub/appstream.dart';
import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  final String categoryId;
  final List<AppStream> appStreamList;
  final String appPath;
  final Function handleGoToApplication;
  final Function handleGoToCategory;

  const Block(
      {required this.categoryId,
      required this.appStreamList,
      required this.appPath,
      required this.handleGoToApplication,
      required this.handleGoToCategory});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = appStreamList.map((appStreamLoop) {
      String icon = '';
      if (appStreamLoop.hasAppIcon()) {
        icon = '$appPath/${appStreamLoop.getAppIcon()}';
      }

      return Container(
          width: 150,
          height: 150,
          child: AppButton(
              id: appStreamLoop.id,
              title: appStreamLoop.name,
              sumary: appStreamLoop.summary,
              icon: icon,
              handle: handleGoToApplication));
    }).toList();

    widgetList.add(Container(
        width: 150,
        height: 150,
        child: TextButton(
          child: Text(AppLocalizations().tr('More')),
          // icon: Icon(Icons.more),
          onPressed: () {
            handleGoToCategory(categoryId);
          },
        )));

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          AppLocalizations().tr(categoryId),
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
        ),
        const SizedBox(height: 10),
        Wrap(children: widgetList),
      ],
    );
  }
}
