part of 'cubit.dart';

// root-state
@immutable
class AuthState extends Equatable {
  final User? user;
  final AuthRegisterState register;
  final AuthLoginState login;

  const AuthState({
    this.user,
    required this.login,
    required this.register,
  });

  @override
  List<Object> get props => [
        // root-state-props
        register,
        login,
      ];

  AuthState copyWith({
    User? user,
    AuthRegisterState? register,
    AuthLoginState? login,
  }) {
    return AuthState(
      user: user ?? this.user,
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
          login: const AuthLoginState(),
          register: const AuthRegisterState(),
        );
}
