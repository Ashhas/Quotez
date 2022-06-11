import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotez/app.dart';

void main() {
  // Needed for executing platform channels functions properly.
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () => runApp(
      const App(),
    ),
  );
}
