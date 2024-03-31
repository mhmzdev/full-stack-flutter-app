part of '../cubit.dart';

@immutable
class StoryFetchAllState extends Equatable {
  static bool match(StoryState a, StoryState b) => a.fetchAll != b.fetchAll;

  final String? message;

  const StoryFetchAllState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class StoryFetchAllDefault extends StoryFetchAllState {}

@immutable
class StoryFetchAllLoading extends StoryFetchAllState {}

@immutable
class StoryFetchAllSuccess extends StoryFetchAllState {
  const StoryFetchAllSuccess() : super();
}

@immutable
class StoryFetchAllFailed extends StoryFetchAllState {
  const StoryFetchAllFailed({super.message});
}
