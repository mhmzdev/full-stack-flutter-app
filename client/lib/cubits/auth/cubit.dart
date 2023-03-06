import 'dart:async';

import 'package:client/services/api.dart';
import 'package:client/services/cache.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

part '_login_state.dart';
part '_fetch_state.dart';
part '_logout_state.dart';
part '_register_state.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<AuthCubit>(context, listen: listen);
  AuthCubit() : super(const AuthStateDefault());

  final repo = _AuthRepository();

  Future<void> fetch(int uid) async {
    emit(state.copyWith(
      fetch: AuthFetchLoading(),
    ));
    try {
      final data = await repo.fetch(uid);

      emit(state.copyWith(
        user: data,
        fetch: const AuthFetchSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        fetch: AuthFetchFailed(message: e.toString()),
      ));
    }
  }

  Future<void> login(String email, String password) async {
    emit(state.copyWith(
      login: AuthLoginLoading(),
    ));
    try {
      final data = await repo.login(
        email,
        password,
      );

      emit(state.copyWith(
        user: data,
        login: const AuthLoginSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        login: AuthLoginFailed(message: e.toString()),
      ));
    }
  }

  Future<void> register(
    String firstName,
    String lastName,
    String username,
    String email,
    String password,
  ) async {
    emit(state.copyWith(
      register: AuthRegisterLoading(),
    ));
    try {
      final data = await repo.register(
        firstName,
        lastName,
        username,
        email,
        password,
      );

      emit(state.copyWith(
        user: data,
        register: const AuthRegisterSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        register: AuthRegisterFailed(message: e.toString()),
      ));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(
      logout: AuthLogoutLoading(),
    ));

    try {
      Cache.resetUid();

      emit(state.copyWith(
        logout: const AuthLogoutSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        logout: AuthLogoutFailed(message: e.toString()),
      ));
    }
  }
}
