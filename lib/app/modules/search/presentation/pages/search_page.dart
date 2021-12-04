import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:unicons/unicons.dart';

import '../../../../core/utils/user_interface/disable_splash.dart';
import '../../../home/presentation/widgets/circular_button.dart';
import '../../../home/presentation/widgets/loading_indicator.dart';
import '../../../home/presentation/widgets/result_card.dart';
import '../../../home/presentation/widgets/rounded_button.dart';
import '../controllers/search_controller.dart';
import '../controllers/search_states.dart';

class SearchPage extends StatefulWidget {
  final String content;

  const SearchPage({@required this.content});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = Modular.get<SearchController>();

  @override
  void initState() {
    super.initState();
    searchController.performSearch(widget.content);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (searchController.state == SearchState.searching ||
            searchController.state == SearchState.finished) {
          return Scaffold(
            floatingActionButtonAnimator: _NoScalingAnimation(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: searchController.state == SearchState.finished
                ? null
                : Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RoundedButton(
                      color: Colors.redAccent[700],
                      padding: const EdgeInsets.all(16),
                      onTap: () =>
                          searchController.cancelSearch(widget.content),
                      child: Center(
                        child: Text(
                          'Cancel search',
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              brightness: Theme.of(context).brightness,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: CircularButton(
                color: Theme.of(context).scaffoldBackgroundColor,
                onTap: () async {
                  await Modular.navigator.maybePop();
                },
                child: Icon(
                  UniconsLine.arrow_left,
                  size: 30,
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
              title: Text(
                'Results for ${widget.content}',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            body: DisableSplash(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          searchController.state.message,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${searchController.magnetLinks.length} results has been found',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        const SizedBox(height: 16),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          addRepaintBoundaries: true,
                          cacheExtent: MediaQuery.of(context).size.height * 5,
                          itemCount: searchController.magnetLinks.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ResultCard(
                                magnetLink: searchController.magnetLinks
                                    .elementAt(index),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (searchController.state == SearchState.cancelled ||
            searchController.state == SearchState.error ||
            searchController.state == SearchState.fatalError) {
          Future.delayed(const Duration(seconds: 5), () async {
            await Modular.navigator.maybePop();
          });

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              brightness: Theme.of(context).brightness,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: CircularButton(
                color: Theme.of(context).scaffoldBackgroundColor,
                onTap: () async {
                  await Modular.navigator.maybePop();
                },
                child: Icon(
                  UniconsLine.arrow_left,
                  size: 30,
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
              title: Text(
                'Results for ${widget.content}',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            body: DisableSplash(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    searchController.state.message,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          );
        }

        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  searchController.state.message,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                LoadingIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NoScalingAnimation extends FloatingActionButtonAnimator {
  double _x;
  double _y;

  @override
  Offset getOffset({Offset begin, Offset end, double progress}) {
    _x = begin.dx + (end.dx - begin.dx) * progress;
    _y = begin.dy + (end.dy - begin.dy) * progress;
    return Offset(_x, _y);
  }

  @override
  Animation<double> getRotationAnimation({Animation<double> parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent);
  }

  @override
  Animation<double> getScaleAnimation({Animation<double> parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent);
  }
}
