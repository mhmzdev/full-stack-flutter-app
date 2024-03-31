part of '../cubit.dart';

@immutable
class AuthLoginState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.login != b.login;

  final String? message;

  const AuthLoginState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class AuthLoginDefault extends AuthLoginState {}

@immutable
class AuthLoginLoading extends AuthLoginState {}

@immutable
class AuthLoginSuccess extends AuthLoginState {
  const AuthLoginSuccess() : super();
}

@immutable
class AuthLoginFailed extends AuthLoginState {
  const AuthLoginFailed({super.message});
}
