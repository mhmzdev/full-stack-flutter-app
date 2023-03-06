part of 'cubit.dart';

// root-state
@immutable
class AuthState extends Equatable {
  final User? user;
  final AuthFetchState fetch;
  final AuthLoginState login;
  final AuthRegisterState register;

  const AuthState({
    this.user,
    required this.fetch,
    required this.login,
    required this.register,
  });

  @override
  List<Object> get props => [
        // root-state-props
        fetch,
        login,
        register,
      ];

  AuthState copyWith({
    User? user,
    AuthFetchState? fetch,
    AuthLoginState? login,
    AuthRegisterState? register,
  }) {
    return AuthState(
      user: user ?? this.user,
      fetch: fetch ?? this.fetch,
      login: login ?? this.login,
      register: register ?? this.register,
    );
  }
}

@immutable
class AuthStateDefault extends AuthState {
  const AuthStateDefault()
      : super(
          // root-state-init
          fetch: const AuthFetchState(),
          login: const AuthLoginState(),
          register: const AuthRegisterState(),
        );
}
