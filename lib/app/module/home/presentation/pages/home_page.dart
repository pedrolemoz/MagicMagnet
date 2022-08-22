import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:unicons/unicons.dart';

import '../../../../core/presentation/utils/unfocus.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  void navigateToResults() => Modular.to.pushNamed(
        '/search/',
        arguments: textController.text,
      );

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Magic Magnet',
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
        drawer: const MagicDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: TextField(
              controller: textController,
              onSubmitted: (_) => navigateToResults(),
              textInputAction: TextInputAction.search,
              textCapitalization: TextCapitalization.sentences,
              enableInteractiveSelection: true,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                prefixIcon: GestureDetector(
                  onTap: navigateToResults,
                  child: const Icon(UniconsLine.search),
                ),
                hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                hintText: 'Search anything here',
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MagicDrawer extends StatelessWidget {
  const MagicDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          children: [
            const DrawerTile(
              title: 'Home',
              routeToNavigate: '/',
              icon: UniconsLine.home_alt,
            ),
            const SizedBox(height: 8),
            const DrawerTile(
              title: 'Settings',
              routeToNavigate: '/settings/',
              icon: UniconsLine.setting,
            ),
            const Divider(indent: 8, endIndent: 8),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Magic Magnet 3 beta (engine 2)',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final String routeToNavigate;
  final IconData icon;

  const DrawerTile({
    required this.title,
    required this.routeToNavigate,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final alreadyInTheRouteToNavigate = Modular.to.path == routeToNavigate;
    return ListTile(
      leading: Icon(icon),
      tileColor: alreadyInTheRouteToNavigate
          ? Theme.of(context).colorScheme.background.withOpacity(0.2)
          : null,
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      onTap: () {
        if (alreadyInTheRouteToNavigate) {
          Modular.to.maybePop();
        } else {
          Modular.to.navigate(routeToNavigate);
        }
      },
    );
  }
}
