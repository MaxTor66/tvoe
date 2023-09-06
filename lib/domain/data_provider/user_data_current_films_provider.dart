import 'package:tvoe/domain/entity/current_film.dart';
import 'package:tvoe/domain/entity/user_current_films.dart';

class UserDataCurrentFilmsProvider {
  UserCurrentFilms userCurrentFilms =
      UserCurrentFilms('', [CurrentFilm('', '', '', '', '', '', '', '')]);

  Future<UserCurrentFilms> loadValue(String user_id) async {
    List<CurrentFilm> currentFilms = [
      CurrentFilm(
          '1',
          'Уэнздей',
          'Жители Хоукинса — дети, подростки  и взрослые — сталкиваются с влиянием чуждого и опасного параллельного измерения.',
          'fantasy',
          'series',
          'images/wednesday.jpg',
          '1:00',
          '1:30',
          seasonId: '1',
          episodeId: '1'),
      CurrentFilm(
          '2',
          'Уэнздей',
          'Юный пират в соломенной шляпе Манки Д. Луффи и его разношерстная команда отправляются на поиски легендарного сокровища.',
          'comedy',
          'series',
          'images/wednesday2.jpg',
          '0:40',
          '1:40',
          seasonId: '2',
          episodeId: '3'),
      CurrentFilm(
          '3',
          'Уэнздей',
          'Юный пират в соломенной шляпе Манки Д. Луффи и его разношерстная команда отправляются на поиски легендарного сокровища.',
          'fantasy',
          'series',
          'images/wednesday.jpg',
          '0:45',
          '1:45',
          seasonId: '3',
          episodeId: '4'),
    ];

    UserCurrentFilms userCurrentFilms = UserCurrentFilms(user_id, currentFilms);
    return userCurrentFilms;
  }
}
