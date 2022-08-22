import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:magic_magnet_engine/domain/entities/magnet_links.dart';
import 'package:unicons/unicons.dart';

import '../../../../core/presentation/utils/disable_splash.dart';
import '../controller/search_bloc.dart';
import '../controller/search_events.dart';

class SearchPage extends StatefulWidget {
  final String query;

  const SearchPage(this.query);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchBloc = Modular.get<SearchBloc>();

  @override
  void initState() {
    searchBloc.add(SearchForMagnetLinksEvent(widget.query));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.query,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: BlocBuilder(
        bloc: searchBloc,
        builder: (context, state) {
          return DisableSplash(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              padding: const EdgeInsets.all(16),
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

class MagnetLinkCard extends StatefulWidget {
  final Function() onTap;
  final MagnetLink magnetLink;

  const MagnetLinkCard({required this.onTap, required this.magnetLink});

  @override
  State<MagnetLinkCard> createState() => _MagnetLinkCardState();
}

class _MagnetLinkCardState extends State<MagnetLinkCard>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isExpanded = false;
  bool hasCompletedAnimation = false;

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
      hasCompletedAnimation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: toggleExpansion,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 100),
        onEnd: () => setState(() => hasCompletedAnimation = true),
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * (isExpanded ? 0.24 : 0.11),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardHeader(
              isExpanded: isExpanded,
              magnetLink: widget.magnetLink,
              toggleExpansion: toggleExpansion,
            ),
            if (isExpanded && hasCompletedAnimation) ...[
              const SizedBox(height: 8),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: CardButton(
                        color: const Color(0xFF0077b6),
                        title: 'Visit source',
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CardButton(
                        color: const Color(0xFF0077b6),
                        title: 'Copy link',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 40,
                child: Expanded(
                  child: CardButton(
                    title: 'Open in torrent client',
                    onTap: () {},
                    color: const Color(0xFF0096c7),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color color;

  const CardButton({
    required this.title,
    required this.onTap,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  final MagnetLink magnetLink;
  final bool isExpanded;
  final Function() toggleExpansion;

  const CardHeader({
    required this.magnetLink,
    required this.isExpanded,
    required this.toggleExpansion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            magnetLink.torrentName,
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        AnimatedRotation(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          turns: isExpanded ? 0.5 : 0,
          child: IconButton(
            onPressed: toggleExpansion,
            icon: const Icon(UniconsLine.angle_down, size: 25),
          ),
        ),
      ],
    );
  }
}
