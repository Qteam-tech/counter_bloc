import 'package:counter_bloc/app.dart';
import 'package:counter_bloc/counter_observer.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  Bloc.observer = CounterObserver();
  HydratedBlocOverrides.runZoned(() => runApp(const CounterApp()),
      storage: storage);
}
