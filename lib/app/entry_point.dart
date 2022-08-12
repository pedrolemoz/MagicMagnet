import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/presentation/theme/theme.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Magic Magnet',
    );
  }
}
