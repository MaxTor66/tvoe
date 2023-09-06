import 'package:flutter/material.dart';
import 'package:tvoe/domain/blocks/watched_films_blocks.dart';
import 'package:tvoe/ui/widgets/primary.dart';
import 'package:provider/provider.dart';

import '../domain/blocks/stage_films_blocks.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tvoe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
        Provider<UserStageFilmsCubit>(
            create: (_) => UserStageFilmsCubit(),
            dispose: (context, value) => value.close()),
        Provider<UserWatchedFilmsCubit>(
            create: (_) => UserWatchedFilmsCubit(),
            dispose: (context, value) => value.close())
      ], child: PrimaryPage()),
    );
  }
}
