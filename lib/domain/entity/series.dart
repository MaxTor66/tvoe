
import 'package:tvoe/domain/entity/season.dart';
import 'package:tvoe/domain/entity/video.dart';

import 'episode.dart';

class Series extends Video{

  final List<Season> seasons;

  Series(super.id, super.title, super.description, super.genre, super.type, super.poster, this.seasons);

  Series copyWith({String? id,  String? title,  String? desription, String? genre, String? type, String? poster, List<Season>? seasons}){
    return  Series(id??this.id, title??this.title,  desription??this.description, genre??this.genre, type??this.type, poster??this.poster, seasons??this.seasons);
  }
}