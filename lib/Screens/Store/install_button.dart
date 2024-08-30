import 'package:dupot_easy_flatpak/Localizations/app_localizations.dart';
import 'package:dupot_easy_flatpak/Models/Flathub/appstream.dart';
import 'package:dupot_easy_flatpak/Screens/Shared/Arguments/applicationIdArgument.dart';
import 'package:flutter/material.dart';

class InstallButton extends StatelessWidget {
  const InstallButton({
    super.key,
    required this.buttonStyle,
    required this.dialogButtonStyle,
    required this.stateAppStream,
  });

  final ButtonStyle buttonStyle;
  final ButtonStyle dialogButtonStyle;
  final AppStream? stateAppStream;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: buttonStyle,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  buttonPadding: const EdgeInsets.all(10),
                  actions: [
                    FilledButton(
                        style: dialogButtonStyle,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context).tr('cancel'))),
                    FilledButton(
                        style: dialogButtonStyle,
                        onPressed: () {
                          Navigator.of(context).pop();

                          Navigator.popAndPushNamed(context, '/installation',
                              arguments:
                                  ApplicationIdArgment(stateAppStream!.id));
                        },
                        child:
                            Text(AppLocalizations.of(context).tr('confirm'))),
                  ],
                  title: Text(
                      AppLocalizations.of(context).tr('confirmation_title')),
                  contentPadding: const EdgeInsets.all(20.0),
                  content: Text(
                      '${AppLocalizations.of(context).tr('do_you_confirm_installation_of')} ${stateAppStream!.name} ?'),
                ));

        //install(application);
      },
      label: Text(AppLocalizations.of(context).tr('install')),
      icon: const Icon(Icons.install_desktop),
    );
  }
}