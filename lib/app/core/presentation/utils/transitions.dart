import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MagicTransitions {
  static final moduleTransition = CustomTransition(
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeThroughTransition(
        animation: animation,
        fillColor: Theme.of(context).colorScheme.background,
        secondaryAnimation: secondaryAnimation,
        child: child,
      );
    },
  );

  static final pageTransition = CustomTransition(
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SharedAxisTransition(
        animation: animation,
        fillColor: Theme.of(context).colorScheme.background,
        secondaryAnimation: secondaryAnimation,
        transitionType: SharedAxisTransitionType.horizontal,
        child: child,
      );
    },
  );
}
