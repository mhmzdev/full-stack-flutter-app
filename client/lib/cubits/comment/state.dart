part of 'cubit.dart';

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
  const CommentFetchAllFailed({String? message}) : super(message: message);
}

// root-state
@immutable
class CommentState extends Equatable {
  final CommentFetchAllState fetchAll;
  final List<Comment>? comments;

  const CommentState({
    required this.fetchAll,
    this.comments,
  });

  @override
  List<Object?> get props => [
        // root-state-props
        fetchAll,
        comments,
      ];

  CommentState copyWith({
    CommentFetchAllState? fetchAll,
    List<Comment>? comments,
  }) {
    return CommentState(
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
        );
}
