import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:magic_magnet_engine/domain/entities/magnet_links.dart';
import 'package:magic_magnet_engine/domain/parameters/search_parameters.dart';

import '../../../../core/presentation/utils/disable_splash.dart';
import '../../../initial/presentation/components/search_box.dart';
import '../controller/search_bloc.dart';
import '../controller/search_events.dart';

class SearchPage extends StatefulWidget {
  final SearchParameters parameters;

  const SearchPage(this.parameters);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchBloc = Modular.get<SearchBloc>();
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.parameters.query;
    searchBloc.add(SearchForMagnetLinksEvent(widget.parameters));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results for ${widget.parameters.query}')),
      body: BlocBuilder(
        bloc: searchBloc,
        builder: (context, state) {
          return DisableSplash(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              // padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: searchBloc.magnetLinks.length,
              itemBuilder: (context, index) {
                final magnetLink = searchBloc.magnetLinks[index];
                return MagnetLinkCard(
                  onTap: () {},
                  magnetLink: magnetLink,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MagnetLinkCard extends StatelessWidget {
  final MagnetLink magnetLink;
  final Function() onTap;

  const MagnetLinkCard({required this.magnetLink, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      dense: true,
      minVerticalPadding: 8,
      onTap: () {},
      title: Text(
        magnetLink.torrentName,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subtitle: Text(
        magnetLink.source,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );

    // return InkWell(
    //   onTap: onTap,
    //   borderRadius: const BorderRadius.all(Radius.circular(16)),
    //   child: Ink(
    //     decoration: BoxDecoration(
    //       color: Theme.of(context).colorScheme.surface,
    //       borderRadius: const BorderRadius.all(Radius.circular(16)),
    //     ),
    //     child: Container(
    //       padding: const EdgeInsets.all(16),
    //       child: Text(
    //         magnetLink.torrentName,
    //         style: Theme.of(context).textTheme.subtitle1,
    //       ),
    //     ),
    //   ),
    // );
  }
}
