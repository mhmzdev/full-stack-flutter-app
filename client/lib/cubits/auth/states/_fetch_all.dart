part of '../cubit.dart';

@immutable
class AuthFetchAllState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.fetchAll != b.fetchAll;

  final String? message;

  const AuthFetchAllState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class AuthFetchAllDefault extends AuthFetchAllState {}

@immutable
class AuthFetchAllLoading extends AuthFetchAllState {}

@immutable
class AuthFetchAllSuccess extends AuthFetchAllState {
  const AuthFetchAllSuccess() : super();
}

@immutable
class AuthFetchAllFailed extends AuthFetchAllState {
  const AuthFetchAllFailed({super.message});
}
