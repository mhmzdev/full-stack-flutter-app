part of 'cubit.dart';

// root-state
@immutable
class CommentState extends Equatable {
  final CommentFetchAllState fetchAll;
  final CommentDeleteState delete;
  final List<Comment>? comments;
  final int? uid;

  const CommentState({
    required this.fetchAll,
    required this.delete,
    this.comments,
    this.uid,
  });

  @override
  List<Object?> get props => [
        // root-state-props
        delete,
        fetchAll,
        comments,
        uid,
      ];

  CommentState copyWith({
    CommentFetchAllState? fetchAll,
    CommentDeleteState? delete,
    List<Comment>? comments,
    int? uid,
  }) {
    return CommentState(
      delete: delete ?? this.delete,
      comments: comments ?? this.comments,
      fetchAll: fetchAll ?? this.fetchAll,
      uid: uid ?? this.uid,
    );
  }
}

@immutable
class CommentStateDefault extends CommentState {
  const CommentStateDefault()
      : super(
          // root-state-init
          fetchAll: const CommentFetchAllState(),
          delete: const CommentDeleteState(),
        );
}
