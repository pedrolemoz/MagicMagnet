import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/entry_point.dart';
import 'app/root_module.dart';

void main() => runApp(
      ModularApp(
        child: const EntryPoint(),
        module: RootModule(),
      ),
    );
