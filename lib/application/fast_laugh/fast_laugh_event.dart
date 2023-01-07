part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = Initialize;

  const factory FastLaughEvent.likeVedio({
    required int id,
  }) = LikeVedio;
  const factory FastLaughEvent.unlikeVedio({
    required int id,
  }) = UnlikeVedio;
}
