import 'package:tvoe/domain/entity/video.dart';

class Film extends Video{

  final String duration;

  Film(super.id, super.title, super.description, super.genre, super.type, super.poster, this.duration);

  Film copyWith({String? id,  String? title, String? description, String? genre, String? type, String? poster, String? duration}){
    return Film(id??this.id, title??this.title, description??this.description, genre??this.genre, type??this.type, poster??this.poster,  duration??this.duration,);
  }

}