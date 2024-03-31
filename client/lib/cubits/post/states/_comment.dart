part of '../cubit.dart';

@immutable
class PostCommentState extends Equatable {
  static bool match(PostState a, PostState b) => a.comment != b.comment;

  final String? message;

  const PostCommentState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class PostCommentDefault extends PostCommentState {}

@immutable
class PostCommentLoading extends PostCommentState {}

@immutable
class PostCommentSuccess extends PostCommentState {
  const PostCommentSuccess() : super();
}

@immutable
class PostCommentFailed extends PostCommentState {
  const PostCommentFailed({super.message});
}
