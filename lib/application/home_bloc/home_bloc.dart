import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/hot_and_new_response/hot_and_new_services.dart';
import 'package:netflix_app/domain/hot_and_new_response/model/hot_and_new_response.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewServices _homeService;

  HomeBloc(this._homeService) : super(HomeState.initial()) {
    // on event get homescreen data
    on<GetHomeScreenData>((event, emit) async {
      // send loading to UI
      emit(state.copyWith(isLoading: true, hasError: false));

      //get Data
      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      //transform Data
      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramaMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
          );
        },
        (HotAndNewResponse response) {
          final pastYear = response.results;
          final trending = response.results;
          final dramas = response.results;
          final southIndian = response.results;
          pastYear.shuffle();
          trending.shuffle();
          dramas.shuffle();
          southIndian.shuffle();
          return HomeState(
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tenseDramaMovieList: dramas,
            southIndianMovieList: southIndian,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
          );
        },
      );
      emit(_state1);

      final _state2 = _tvResult.fold(
        (MainFailure failure) {
          return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramaMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
          );
        },
        (HotAndNewResponse response) {
          final top10List = response.results;
          HomeState(
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: top10List,
            tenseDramaMovieList: state.tenseDramaMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: top10List,
            isLoading: false,
            hasError: false,
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
          );
        },
      );

      //send to UI
      emit(_state2!);
    });
  }
}
