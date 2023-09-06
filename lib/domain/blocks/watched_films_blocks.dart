
import 'package:bloc/bloc.dart';

import '../data_provider/user_data_current_films_provider.dart';
import '../data_provider/user_data_films_stage_provider.dart';
import '../entity/current_film.dart';
import '../entity/user_current_films.dart';

class UserWatchedFilmsState{
  final UserCurrentFilms currentUserWatchedFilms;

  UserWatchedFilmsState(this.currentUserWatchedFilms);



  @override
  bool operator==(Object other)=>
      identical(this, other)||(other is UserWatchedFilmsState
          &&runtimeType==other.runtimeType && currentUserWatchedFilms==other.currentUserWatchedFilms
      );

  @override
  int get hashCode=>currentUserWatchedFilms.hashCode;

  UserWatchedFilmsState copyWith({UserCurrentFilms? currentUserWatchedFilms}){
    return  UserWatchedFilmsState(currentUserWatchedFilms??this.currentUserWatchedFilms);

  }


}




class UserWatchedFilmsCubit extends Cubit<UserWatchedFilmsState>{
  final _userDataCurrentFilmsProvider=UserDataCurrentFilmsProvider();

  UserWatchedFilmsCubit():super(UserWatchedFilmsState(UserCurrentFilms('', [CurrentFilm('', '', '', '', '', '','','')]))){
    _initialize();
  }


  Future<void> _initialize() async {
    final userWatchedFilms=await _userDataCurrentFilmsProvider.loadValue('1');
    final newState=state.copyWith(currentUserWatchedFilms:userWatchedFilms);
    emit(newState);

  }



}