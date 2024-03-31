part of '../cubit.dart';

@immutable
class PostShareState extends Equatable {
  static bool match(PostState a, PostState b) => a.share != b.share;

  final String? message;

  const PostShareState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class PostShareDefault extends PostShareState {}

@immutable
class PostShareLoading extends PostShareState {}

@immutable
class PostShareSuccess extends PostShareState {
  const PostShareSuccess() : super();
}

@immutable
class PostShareFailed extends PostShareState {
  const PostShareFailed({super.message});
}
