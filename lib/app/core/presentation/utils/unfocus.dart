import 'package:flutter/material.dart';

class Unfocus extends StatelessWidget {
  final Widget child;

  const Unfocus({required this.child});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null)
          currentFocus.focusedChild?.unfocus();
      },
      child: child,
    );
  }
}
