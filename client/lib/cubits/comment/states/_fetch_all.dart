part of '../cubit.dart';

@immutable
class CommentFetchAllState extends Equatable {
  static bool match(CommentState a, CommentState b) => a.fetchAll != b.fetchAll;

  final String? message;

  const CommentFetchAllState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class CommentFetchAllDefault extends CommentFetchAllState {}

@immutable
class CommentFetchAllLoading extends CommentFetchAllState {}

@immutable
class CommentFetchAllSuccess extends CommentFetchAllState {
  const CommentFetchAllSuccess() : super();
}

@immutable
class CommentFetchAllFailed extends CommentFetchAllState {
  const CommentFetchAllFailed({super.message});
}
