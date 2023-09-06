import 'package:bloc/bloc.dart';
import 'package:tvoe/domain/entity/video.dart';

import '../data_provider/user_data_films_stage_provider.dart';
import '../entity/user_stage_films.dart';

class UserStageFilmsState {
  final UserStageFilms currentUserStageFilms;

  UserStageFilmsState(this.currentUserStageFilms);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserStageFilmsState &&
          runtimeType == other.runtimeType &&
          currentUserStageFilms == other.currentUserStageFilms);

  @override
  int get hashCode => currentUserStageFilms.hashCode;

  UserStageFilmsState copyWith({UserStageFilms? currentUserStageFilms}) {
    return UserStageFilmsState(
        currentUserStageFilms ?? this.currentUserStageFilms);
  }
}

class UserStageFilmsCubit extends Cubit<UserStageFilmsState> {
  final _userDataFilmsStageProvider = UserDataFilmsStageProvider();

  UserStageFilmsCubit()
      : super(UserStageFilmsState(
            UserStageFilms("", [Video("", "", "", "", "", "")]))) {
    _initialize();
  }

  Future<void> _initialize() async {
    final userStageFilms = await _userDataFilmsStageProvider.loadValue('1');
    final newState = state.copyWith(currentUserStageFilms: userStageFilms);
    emit(newState);
  }
}
