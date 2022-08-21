import 'package:flutter_modular/flutter_modular.dart';

import '../../core/presentation/utils/transitions.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
          transition: TransitionType.custom,
          customTransition: MagicTransitions.pageTransition,
        ),
      ];
}
