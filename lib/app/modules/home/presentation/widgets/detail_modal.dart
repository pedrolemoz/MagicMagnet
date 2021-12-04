import 'package:asuka/asuka.dart' as asuka;
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:magic_magnet_engine/magic_magnet_engine.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/user_interface/disable_splash.dart';
import 'floating_snack_bar.dart';
import 'rounded_button.dart';

class DetailModal extends StatelessWidget {
  final MagnetLink magnetLink;

  const DetailModal({this.magnetLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: DisableSplash(
        child: ListView(
          cacheExtent: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Torrent name',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              magnetLink.torrentName,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avaliability',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  magnetLink?.magnetLinkInfo?.seeders != null
                      ? '${magnetLink.magnetLinkInfo.seeders} seeders'
                      : 'Fetching seeders data...',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  magnetLink?.magnetLinkInfo?.leechers != null
                      ? '${magnetLink.magnetLinkInfo.leechers} leechers'
                      : 'Fetching leechers data...',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  magnetLink?.magnetLinkInfo?.health != null
                      ? '${magnetLink.magnetLinkInfo.health}% healthy (ratio between seeders and leechers)'
                      : 'Calculating torrent health...',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Original source',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  magnetLink.originalSource,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Avaliable actions',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RoundedButton(
                      color: Theme.of(context).accentColor,
                      padding: const EdgeInsets.all(16),
                      onTap: () async {
                        await FlutterClipboard.copy(
                          magnetLink.magnetLink,
                        ).then(
                          (_) => asuka.showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              elevation: 0,
                              content: FloatingSnackBar(
                                text:
                                    'Magnet link sucessfully copied to clipboard',
                              ),
                            ),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          'Copy magnet link',
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RoundedButton(
                      color: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.all(16),
                      onTap: () async {
                        try {
                          await launch(magnetLink.magnetLink);
                        } catch (e) {
                          asuka.showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              elevation: 0,
                              content: FloatingSnackBar(
                                text:
                                    "You don't have any compatible app to open this link",
                              ),
                            ),
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          'Open magnet link',
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RoundedButton(
                      color: Colors.amber[600],
                      padding: const EdgeInsets.all(16),
                      onTap: () async {
                        try {
                          await launch(
                            magnetLink.originalSource,
                          );
                        } catch (e) {
                          asuka.showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              elevation: 0,
                              content: FloatingSnackBar(
                                text:
                                    "You don't have any compatible app to open this link",
                              ),
                            ),
                          );
                        }
                      },
                      child: Center(
                        child: Text(
                          'Open original source',
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
