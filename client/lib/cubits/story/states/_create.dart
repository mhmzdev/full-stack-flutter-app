part of '../cubit.dart';

@immutable
class StoryCreateState extends Equatable {
  static bool match(StoryState a, StoryState b) => a.create != b.create;

  final String? message;

  const StoryCreateState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class StoryCreateDefault extends StoryCreateState {}

@immutable
class StoryCreateLoading extends StoryCreateState {}

@immutable
class StoryCreateSuccess extends StoryCreateState {
  const StoryCreateSuccess() : super();
}

@immutable
class StoryCreateFailed extends StoryCreateState {
  const StoryCreateFailed({super.message});
}
