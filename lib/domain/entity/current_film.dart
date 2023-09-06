import 'package:tvoe/domain/entity/film.dart';
import 'package:tvoe/domain/entity/video.dart';

class CurrentFilm extends Video {
  final String seasonId;
  final String episodeId;
  final String episodeTitle;
  final String episodePoster;
  final String stateSpot;
  final String duration;

  CurrentFilm(super.id, super.title, super.description, super.genre, super.type,
      super.poster, this.stateSpot, this.duration,
      {this.seasonId = "",
      this.episodeId = "",
      this.episodeTitle = "",
      this.episodePoster = ""});
}
