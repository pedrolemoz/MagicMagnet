import 'package:flutter_modular/flutter_modular.dart';

import '../../core/presentation/utils/transitions.dart';
import 'presentation/pages/settings_page.dart';

class SettingsModule extends Module {
  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => SettingsPage(),
          transition: TransitionType.custom,
          customTransition: MagicTransitions.pageTransition,
        ),
      ];
}
