part of 'cubit.dart';

// root-state
@immutable
class AuthState extends Equatable {
  final DPUploadState dp;
  final FollowState follow;
  final AuthFetchState fetch;
  final AuthFetchAllState fetchAll;
  final AuthLoginState login;
  final AuthLogoutState logout;
  final CoverUploadState cover;
  final AuthUpdateState update;
  final AuthRegisterState register;
  final User? user;
  final List<User>? users;

  const AuthState({
    this.user,
    this.users,
    required this.dp,
    required this.fetch,
    required this.cover,
    required this.login,
    required this.follow,
    required this.logout,
    required this.update,
    required this.fetchAll,
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
        follow,
        update,
        fetchAll,
        register,
      ];

  AuthState copyWith({
    User? user,
    List<User>? users,
    DPUploadState? dp,
    FollowState? follow,
    AuthFetchState? fetch,
    AuthLoginState? login,
    CoverUploadState? cover,
    AuthUpdateState? update,
    AuthFetchAllState? fetchAll,
    AuthLogoutState? logout,
    AuthRegisterState? register,
  }) {
    return AuthState(
      dp: dp ?? this.dp,
      user: user ?? this.user,
      users: users ?? this.users,
      fetch: fetch ?? this.fetch,
      cover: cover ?? this.cover,
      login: login ?? this.login,
      follow: follow ?? this.follow,
      logout: logout ?? this.logout,
      update: update ?? this.update,
      fetchAll: fetchAll ?? this.fetchAll,
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
          follow: const FollowState(),
          fetch: const AuthFetchState(),
          login: const AuthLoginState(),
          logout: const AuthLogoutState(),
          cover: const CoverUploadState(),
          update: const AuthUpdateState(),
          fetchAll: const AuthFetchAllState(),
          register: const AuthRegisterState(),
        );
}
