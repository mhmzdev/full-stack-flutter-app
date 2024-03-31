part of '../cubit.dart';

@immutable
class AuthUpdateState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.update != b.update;

  final String? message;

  const AuthUpdateState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class AuthUpdateDefault extends AuthUpdateState {}

@immutable
class AuthUpdateLoading extends AuthUpdateState {}

@immutable
class AuthUpdateSuccess extends AuthUpdateState {
  const AuthUpdateSuccess() : super();
}

@immutable
class AuthUpdateFailed extends AuthUpdateState {
  const AuthUpdateFailed({super.message});
}
