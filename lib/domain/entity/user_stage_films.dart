import 'package:tvoe/domain/entity/film.dart';
import 'package:tvoe/domain/entity/video.dart';

class UserStageFilms {
  final String userId;
  final List<Video> stageFilms;

  UserStageFilms(this.userId, this.stageFilms);

  UserStageFilms copyWith({String? userId, List<Video>? stageFilms}) {
    return UserStageFilms(userId ?? this.userId, stageFilms ?? this.stageFilms);
  }
}
