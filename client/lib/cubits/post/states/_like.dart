part of '../cubit.dart';

@immutable
class PostLikeState extends Equatable {
  static bool match(PostState a, PostState b) => a.like != b.like;

  final String? message;

  const PostLikeState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class PostLikeDefault extends PostLikeState {}

@immutable
class PostLikeLoading extends PostLikeState {}

@immutable
class PostLikeSuccess extends PostLikeState {
  const PostLikeSuccess() : super();
}

@immutable
class PostLikeFailed extends PostLikeState {
  const PostLikeFailed({super.message});
}
