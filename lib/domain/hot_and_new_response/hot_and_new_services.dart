

import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/hot_and_new_response/model/hot_and_new_response.dart';

abstract class HotAndNewServices{

  Future<Either<MainFailure,HotAndNewResponse>> getHotAndNewMovieData();
   Future<Either<MainFailure,HotAndNewResponse>> getHotAndNewTvData();
}