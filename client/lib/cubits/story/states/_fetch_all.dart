part of '../cubit.dart';

@immutable
class StoryFetchAllState extends Equatable {
  static bool match(StoryState a, StoryState b) => a.fetchAll != b.fetchAll;

  final Story? data;
  final String? message;

  const StoryFetchAllState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}

@immutable
class StoryFetchAllDefault extends StoryFetchAllState {}

@immutable
class StoryFetchAllLoading extends StoryFetchAllState {}

@immutable
class StoryFetchAllSuccess extends StoryFetchAllState {
  const StoryFetchAllSuccess({required Story data}) : super(data: data);
}

@immutable
class StoryFetchAllFailed extends StoryFetchAllState {
  const StoryFetchAllFailed({String? message}) : super(message: message);
}
