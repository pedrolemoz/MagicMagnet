import 'package:flutter_modular/flutter_modular.dart';

import '../../core/presentation/utils/transitions.dart';
import 'presentation/pages/initial_page.dart';

class InitialModule extends Module {
  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const InitialPage(),
          transition: TransitionType.custom,
          customTransition: MagicTransitions.pageTransition,
        ),
      ];
}
