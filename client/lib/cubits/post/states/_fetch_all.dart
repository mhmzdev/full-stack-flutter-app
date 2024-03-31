part of '../cubit.dart';

@immutable
class PostFetchAllState extends Equatable {
  static bool match(PostState a, PostState b) => a.fetchAll != b.fetchAll;

  final String? message;

  const PostFetchAllState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class PostFetchAllDefault extends PostFetchAllState {}

@immutable
class PostFetchAllLoading extends PostFetchAllState {}

@immutable
class PostFetchAllSuccess extends PostFetchAllState {
  const PostFetchAllSuccess() : super();
}

@immutable
class PostFetchAllFailed extends PostFetchAllState {
  const PostFetchAllFailed({super.message});
}
