part of '../cubit.dart';

@immutable
class StoryDeleteState extends Equatable {
  static bool match(StoryState a, StoryState b) => a.delete != b.delete;

  final String? message;

  const StoryDeleteState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class StoryDeleteDefault extends StoryDeleteState {}

@immutable
class StoryDeleteLoading extends StoryDeleteState {}

@immutable
class StoryDeleteSuccess extends StoryDeleteState {
  const StoryDeleteSuccess() : super();
}

@immutable
class StoryDeleteFailed extends StoryDeleteState {
  const StoryDeleteFailed({super.message});
}
