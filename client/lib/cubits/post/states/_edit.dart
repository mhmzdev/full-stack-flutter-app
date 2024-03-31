part of '../cubit.dart';

@immutable
class PostEditState extends Equatable {
  static bool match(PostState a, PostState b) => a.edit != b.edit;

  final String? message;

  const PostEditState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class PostEditDefault extends PostEditState {}

@immutable
class PostEditLoading extends PostEditState {}

@immutable
class PostEditSuccess extends PostEditState {
  const PostEditSuccess() : super();
}

@immutable
class PostEditFailed extends PostEditState {
  const PostEditFailed({super.message});
}
