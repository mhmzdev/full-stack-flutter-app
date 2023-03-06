part of 'cubit.dart';

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
  const AuthRegisterFailed({String? message}) : super(message: message);
}

// root-state
@immutable
class AuthState extends Equatable {
  final User? user;
  final AuthRegisterState register;

  const AuthState({
    this.user,
    required this.register,
  });

  @override
  List<Object> get props => [
        // root-state-props
        register,
      ];

  AuthState copyWith({
    User? user,
    AuthRegisterState? register,
  }) {
    return AuthState(
      user: user ?? this.user,
      register: register ?? this.register,
    );
  }
}

@immutable
class AuthStateDefault extends AuthState {
  const AuthStateDefault()
      : super(
          // root-state-init
          register: const AuthRegisterState(),
        );
}
