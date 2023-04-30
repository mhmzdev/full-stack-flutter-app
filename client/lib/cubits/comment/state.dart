part of 'cubit.dart';

// root-state
@immutable
class CommentState extends Equatable {
  final CommentFetchAllState fetchAll;
  final CommentDeleteState delete;
  final List<Comment>? comments;

  const CommentState({
    required this.fetchAll,
    required this.delete,
    this.comments,
  });

  @override
  List<Object?> get props => [
        // root-state-props
        delete,
        fetchAll,
        comments,
      ];

  CommentState copyWith({
    CommentFetchAllState? fetchAll,
    CommentDeleteState? delete,
    List<Comment>? comments,
  }) {
    return CommentState(
      delete: delete ?? this.delete,
      comments: comments ?? this.comments,
      fetchAll: fetchAll ?? this.fetchAll,
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
