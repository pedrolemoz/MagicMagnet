import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:magic_magnet_engine/domain/entities/providers.dart';
import 'package:magic_magnet_engine/domain/parameters/search_parameters.dart';
import 'package:unicons/unicons.dart';

import '../../../../core/presentation/utils/unfocus.dart';
import '../components/search_box.dart';

class InitialPage extends StatefulWidget {
  const InitialPage();

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Search settings',
                style: Theme.of(context).textTheme.button,
              ),
              const VerticalDivider(),
              const Icon(UniconsLine.setting)
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          onPressed: () => Modular.to.pushNamed('/settings/'),
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/images/logo_512x512.png',
                      scale: 10,
                    ),
                  ),
                  const VerticalDivider(color: Colors.transparent),
                  Text(
                    'Magic Magnet',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              const SizedBox(height: 36),
              SearchBox(
                onSubmitted: (query) => Modular.to.pushNamed(
                  '/search/',
                  arguments: SearchParameters(query, [Providers.tpb]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
