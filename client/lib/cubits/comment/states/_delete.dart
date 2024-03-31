part of '../cubit.dart';

@immutable
class CommentDeleteState extends Equatable {
  static bool match(CommentState a, CommentState b) => a.delete != b.delete;

  final String? message;

  const CommentDeleteState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class CommentDeleteDefault extends CommentDeleteState {}

@immutable
class CommentDeleteLoading extends CommentDeleteState {}

@immutable
class CommentDeleteSuccess extends CommentDeleteState {
  const CommentDeleteSuccess() : super();
}

@immutable
class CommentDeleteFailed extends CommentDeleteState {
  const CommentDeleteFailed({super.message});
}
