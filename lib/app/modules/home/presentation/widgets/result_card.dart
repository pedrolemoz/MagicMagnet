import 'package:asuka/asuka.dart' as asuka;
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:magic_magnet_engine/magic_magnet_engine.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

import 'detail_modal.dart';
import 'floating_snack_bar.dart';
import 'rounded_button.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({@required this.magnetLink});

  final MagnetLink magnetLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showMaterialModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => DetailModal(magnetLink: magnetLink),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/launcher/foreground.png',
                  scale: 7,
                ),
                Flexible(
                  child: Text(
                    magnetLink.torrentName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: RoundedButton(
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
                ),
                const VerticalDivider(width: 6),
                Expanded(
                  child: RoundedButton(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
