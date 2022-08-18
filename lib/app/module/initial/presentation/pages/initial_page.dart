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
  final controller = TextEditingController();
  bool enableCursor = false;

  @override
  void initState() {
    controller.addListener(
      () => setState(() => enableCursor = controller.text.isNotEmpty),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        floatingActionButton: ElevatedButton(
          onPressed: () => Modular.to.pushNamed('/settings/'),
          style: ElevatedButton.styleFrom(
            // surfaceTintColor: Theme.of(context).colorScheme.tertiary,
            splashFactory: InkSparkle.splashFactory,
          ),
          child: IntrinsicWidth(
            child: IntrinsicHeight(
              child: Row(
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
            ),
          ),
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
              const SizedBox(height: 32),
              TextField(
                controller: controller,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.sentences,
                enableSuggestions: true,
                showCursor: enableCursor,
                enableInteractiveSelection: true,
                maxLines: 1,
                onSubmitted: (query) => Modular.to.pushNamed(
                  '/search/',
                  arguments: SearchParameters(query, [Providers.tpb]),
                ),
                style: Theme.of(context).textTheme.subtitle1,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Search something here',
                  hintStyle: Theme.of(context).textTheme.subtitle1,
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: Theme.of(context).colorScheme.surface,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(16),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  splashFactory: InkSparkle.splashFactory,
                ),
                child: const Text('Sparkle!'),
                onPressed: () {},
              ),
              // SearchBox(
              //   controller: controller,
              //   onSubmitted: (query) => Modular.to.pushNamed(
              //     '/search/',
              //     arguments: SearchParameters(query, [Providers.tpb]),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
