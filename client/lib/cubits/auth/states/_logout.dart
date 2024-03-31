part of '../cubit.dart';

@immutable
class AuthLogoutState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.logout != b.logout;

  final String? message;

  const AuthLogoutState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class AuthLogoutDefault extends AuthLogoutState {}

@immutable
class AuthLogoutLoading extends AuthLogoutState {}

@immutable
class AuthLogoutSuccess extends AuthLogoutState {
  const AuthLogoutSuccess() : super();
}

@immutable
class AuthLogoutFailed extends AuthLogoutState {
  const AuthLogoutFailed({super.message});
}
