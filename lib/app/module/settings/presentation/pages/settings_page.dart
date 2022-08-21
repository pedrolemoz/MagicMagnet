import 'package:flutter/material.dart';

import '../../../../core/presentation/utils/disable_splash.dart';
import '../../../home/presentation/pages/home_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage();

  @override
  Widget build(BuildContext context) {
    return DisableSplash(
      child: Scaffold(
        drawer: const MagicDrawer(),
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
