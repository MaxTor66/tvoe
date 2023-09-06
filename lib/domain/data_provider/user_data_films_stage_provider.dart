import 'package:tvoe/domain/entity/film.dart';
import 'package:tvoe/domain/entity/user_stage_films.dart';

import '../entity/video.dart';

class UserDataFilmsStageProvider{

  UserStageFilms userStageFilms=UserStageFilms('', [Video('', '', '', '', '', '')]);

  Future<UserStageFilms> loadValue(String user_id)async{

List<Video> stageFilms=[
  Film('1', 'Седьмое королевтсво', 'Жители Хоукинса — дети, подростки  и взрослые — сталкиваются с влиянием чуждого и опасного параллельного измерения.', 'fantasy', 'series', 'images/seven_kingdom2.png', '3:30'),
  Film('2', 'Мег 2', 'Юный пират в соломенной шляпе Манки Д. Луффи и его разношерстная команда отправляются на поиски легендарного сокровища.', 'comedy', 'series', 'images/one_piece.jpeg', '3:30'),
  Film('3', 'Седьмое королевтсво', 'Жители Хоукинса — дети, подростки  и взрослые — сталкиваются с влиянием чуждого и опасного параллельного измерения.', 'fantasy', 'series', 'images/seven_kingdom2.png', '3:30'),

];

UserStageFilms userStageFilms=UserStageFilms(user_id, stageFilms);
return userStageFilms;
  }



}