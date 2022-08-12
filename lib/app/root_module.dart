import 'package:flutter_modular/flutter_modular.dart';

import 'core/presentation/utils/transitions.dart';
import 'module/initial/initial_module.dart';
import 'module/search/search_module.dart';
import 'module/settings/settings_module.dart';

class RootModule extends Module {
  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: InitialModule(),
          transition: TransitionType.custom,
          customTransition: MagicTransitions.moduleTransition,
        ),
        ModuleRoute(
          '/settings',
          module: SettingsModule(),
          transition: TransitionType.custom,
          customTransition: MagicTransitions.moduleTransition,
        ),
        ModuleRoute(
          '/search',
          module: SearchModule(),
          transition: TransitionType.custom,
          customTransition: MagicTransitions.moduleTransition,
        ),
      ];
}
