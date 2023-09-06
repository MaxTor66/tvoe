import 'current_film.dart';

class UserCurrentFilms{
  final String userId;
  final List<CurrentFilm> currentFilms;

  UserCurrentFilms(this.userId, this.currentFilms);
  UserCurrentFilms copyWith({String? userId, List<CurrentFilm>? currentFilms}){
    return UserCurrentFilms(userId??this.userId, currentFilms??this.currentFilms);
  }

}