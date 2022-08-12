import 'package:flutter_modular/flutter_modular.dart';
import 'package:magic_magnet_engine/domain/usecases/search_for_magnet_links.dart';
import 'package:magic_magnet_engine/external/datasources/google_search_datasource_implementation.dart';
import 'package:magic_magnet_engine/external/datasources/the_pirate_bay_search_datasource_implementation.dart';
import 'package:magic_magnet_engine/infrastructure/repositories/search_repository_implementation.dart';
import 'package:magic_magnet_engine/packages/network/http_client/implementation/dio_client_implementation.dart';

import '../../core/presentation/utils/transitions.dart';
import 'presentation/controller/search_bloc.dart';
import 'presentation/pages/search_page.dart';

class SearchModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => DioClientImplementation()),
        Bind((i) => TPBSearchDataSourceImplementation(i())),
        Bind((i) => GoogleSearchDataSourceImplementation(i())),
        Bind((i) => SearchRepositoryImplementation(i(), i())),
        Bind((i) => SearchForMagnetLinks(i())),
        Bind<SearchBloc>(
          (i) => SearchBloc(i()),
          onDispose: (bloc) => bloc.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => SearchPage(args.data),
          transition: TransitionType.custom,
          customTransition: MagicTransitions.pageTransition,
        ),
      ];
}
