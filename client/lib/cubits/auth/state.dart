part of 'cubit.dart';

// root-state
@immutable
class AuthState extends Equatable {
  final DPUploadState dp;
  final AuthFetchState fetch;
  final AuthLoginState login;
  final AuthLogoutState logout;
  final CoverUploadState cover;
  final AuthUpdateState update;
  final AuthRegisterState register;
  final User? user;

  const AuthState({
    this.user,
    required this.dp,
    required this.fetch,
    required this.cover,
    required this.login,
    required this.logout,
    required this.update,
    required this.register,
  });

  @override
  List<Object> get props => [
        // root-state-props
        dp,
        fetch,
        login,
        cover,
        logout,
        update,
        register,
      ];

  AuthState copyWith({
    User? user,
    DPUploadState? dp,
    AuthFetchState? fetch,
    AuthLoginState? login,
    CoverUploadState? cover,
    AuthUpdateState? update,
    AuthLogoutState? logout,
    AuthRegisterState? register,
  }) {
    return AuthState(
      dp: dp ?? this.dp,
      user: user ?? this.user,
      fetch: fetch ?? this.fetch,
      cover: cover ?? this.cover,
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
          dp: const DPUploadState(),
          fetch: const AuthFetchState(),
          login: const AuthLoginState(),
          logout: const AuthLogoutState(),
          cover: const CoverUploadState(),
          update: const AuthUpdateState(),
          register: const AuthRegisterState(),
        );
}
