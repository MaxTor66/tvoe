import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvoe/domain/blocks/watched_films_blocks.dart';
import 'package:tvoe/ui/widgets/watched_films.dart';

import '../../domain/blocks/stage_films_blocks.dart';
import 'films_stage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          FilmsStage(),
          SizedBox(
            height: 32,
          ),
          WatchedFilms()
        ],
      ),
    );
  }
}
