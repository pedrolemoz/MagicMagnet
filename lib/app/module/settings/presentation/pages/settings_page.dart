import 'package:flutter/material.dart';

import '../../../../core/presentation/utils/disable_splash.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage();

  @override
  Widget build(BuildContext context) {
    return DisableSplash(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
