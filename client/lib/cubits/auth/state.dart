part of 'cubit.dart';

// root-state
@immutable
class AuthState extends Equatable {
  final User? user;
  final AuthFetchState fetch;
  final AuthLoginState login;
  final AuthLogoutState logout;
  final AuthUpdateState update;
  final AuthRegisterState register;

  const AuthState({
    this.user,
    required this.fetch,
    required this.login,
    required this.logout,
    required this.update,
    required this.register,
  });

  @override
  List<Object> get props => [
        // root-state-props
        fetch,
        login,
        logout,
        update,
        register,
      ];

  AuthState copyWith({
    User? user,
    AuthFetchState? fetch,
    AuthLoginState? login,
    AuthUpdateState? update,
    AuthLogoutState? logout,
    AuthRegisterState? register,
  }) {
    return AuthState(
      user: user ?? this.user,
      fetch: fetch ?? this.fetch,
      login: login ?? this.login,
      logout: logout ?? this.logout,
      update: update ?? this.update,
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
          logout: const AuthLogoutState(),
          update: const AuthUpdateState(),
          register: const AuthRegisterState(),
        );
}
