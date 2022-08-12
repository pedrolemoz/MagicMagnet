import 'package:flutter/material.dart';

class DisableSplash extends StatelessWidget {
  final Widget child;

  const DisableSplash({required this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: child,
    );
  }
}
