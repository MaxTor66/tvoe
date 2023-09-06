import 'package:tvoe/domain/entity/video.dart';

class Episode extends Video {
  final String duration;

  Episode(super.id, super.title, super.description, super.genre, super.type,
      super.poster, this.duration);

  Episode copyWith({
    String? id,
    String? title,
    String? desription,
    String? genre,
    String? type,
    String? poster,
    String? duration,
  }) {
    return Episode(
      id ?? this.id,
      title ?? this.title,
      desription ?? this.description,
      genre ?? this.genre,
      type ?? this.type,
      poster ?? this.poster,
      duration ?? this.duration,
    );
  }
}
