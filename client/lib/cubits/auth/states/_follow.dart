part of '../cubit.dart';

@immutable
class FollowState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.follow != b.follow;

  final String? message;

  const FollowState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class FollowDefault extends FollowState {}

@immutable
class FollowLoading extends FollowState {}

@immutable
class FollowSuccess extends FollowState {
  const FollowSuccess() : super();
}

@immutable
class FollowFailed extends FollowState {
  const FollowFailed({super.message});
}
