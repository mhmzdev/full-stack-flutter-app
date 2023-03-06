part of 'cubit.dart';

@immutable
class AuthRegisterState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.register != b.register;

  final User? data;
  final String? message;

  const AuthRegisterState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}

@immutable
class AuthRegisterDefault extends AuthRegisterState {}

@immutable
class AuthRegisterLoading extends AuthRegisterState {}

@immutable
class AuthRegisterSuccess extends AuthRegisterState {
  const AuthRegisterSuccess({required User data}) : super(data: data);
}

@immutable
class AuthRegisterFailed extends AuthRegisterState {
  const AuthRegisterFailed({String? message}) : super(message: message);
}

// root-state
@immutable
class AuthState extends Equatable {
  final AuthRegisterState register;

  const AuthState({
    required this.register,
  });

  @override
  List<Object> get props => [
        // root-state-props
        register,
      ];

  AuthState copyWith({
    AuthRegisterState? register,
  }) {
    return AuthState(
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
