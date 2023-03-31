part of 'cubit.dart';

// root-state
@immutable
class PostState extends Equatable {
  final List<Post>? posts;
  final PostFetchAllState fetchAll;
  final PostCommentState comment;
  final PostCreateState create;
  final PostDeleteState delete;
  final PostEditState edit;
  final PostLikeState like;
  final PostShareState share;

  const PostState({
    this.posts,
    required this.fetchAll,
    required this.comment,
    required this.create,
    required this.delete,
    required this.edit,
    required this.like,
    required this.share,
  });

  @override
  List<Object?> get props => [
        // root-state-props
        posts,
        fetchAll,
        create,
        comment,
        delete,
        edit,
        like,
        share,
      ];

  PostState copyWith({
    List<Post>? posts,
    PostFetchAllState? fetchAll,
    PostCommentState? comment,
    PostCreateState? create,
    PostDeleteState? delete,
    PostEditState? edit,
    PostLikeState? like,
    PostShareState? share,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      fetchAll: fetchAll ?? this.fetchAll,
      comment: comment ?? this.comment,
      create: create ?? this.create,
      delete: delete ?? this.delete,
      edit: edit ?? this.edit,
      like: like ?? this.like,
      share: share ?? this.share,
    );
  }
}

@immutable
class PostStateDefault extends PostState {
  const PostStateDefault()
      : super(
          // root-state-init
          fetchAll: const PostFetchAllState(),
          comment: const PostCommentState(),
          create: const PostCreateState(),
          delete: const PostDeleteState(),
          edit: const PostEditState(),
          like: const PostLikeState(),
          share: const PostShareState(),
        );
}
