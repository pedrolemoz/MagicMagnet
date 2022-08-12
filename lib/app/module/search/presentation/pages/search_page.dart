import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:magic_magnet_engine/domain/parameters/search_parameters.dart';

import '../../../../core/presentation/utils/disable_splash.dart';
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

  @override
  void initState() {
    searchBloc.add(SearchForMagnetLinksEvent(widget.parameters));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results for ${widget.parameters.query}',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: BlocBuilder(
        bloc: searchBloc,
        builder: (context, state) {
          return DisableSplash(
            child: ListView.builder(
              itemCount: searchBloc.magnetLinks.length,
              itemBuilder: (context, index) {
                final magnetLink = searchBloc.magnetLinks[index];
                return ListTile(title: Text(magnetLink.torrentName));
              },
            ),
          );
        },
      ),
    );
  }
}
