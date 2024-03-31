part of '../cubit.dart';

@immutable
class AuthRegisterState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.register != b.register;

  final String? message;

  const AuthRegisterState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class AuthRegisterDefault extends AuthRegisterState {}

@immutable
class AuthRegisterLoading extends AuthRegisterState {}

@immutable
class AuthRegisterSuccess extends AuthRegisterState {
  const AuthRegisterSuccess() : super();
}

@immutable
class AuthRegisterFailed extends AuthRegisterState {
  const AuthRegisterFailed({super.message});
}
