part of '../cubit.dart';

@immutable
class PostCreateState extends Equatable {
  static bool match(PostState a, PostState b) => a.create != b.create;

  final String? message;

  const PostCreateState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class PostCreateDefault extends PostCreateState {}

@immutable
class PostCreateLoading extends PostCreateState {}

@immutable
class PostCreateSuccess extends PostCreateState {
  const PostCreateSuccess() : super();
}

@immutable
class PostCreateFailed extends PostCreateState {
  const PostCreateFailed({super.message});
}
