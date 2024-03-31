part of '../cubit.dart';

@immutable
class PostDeleteState extends Equatable {
  static bool match(PostState a, PostState b) => a.delete != b.delete;

  final String? message;

  const PostDeleteState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class PostDeleteDefault extends PostDeleteState {}

@immutable
class PostDeleteLoading extends PostDeleteState {}

@immutable
class PostDeleteSuccess extends PostDeleteState {
  const PostDeleteSuccess() : super();
}

@immutable
class PostDeleteFailed extends PostDeleteState {
  const PostDeleteFailed({super.message});
}
