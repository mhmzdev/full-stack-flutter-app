import 'dart:async';

import 'package:client/services/api.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared/shared.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<AuthCubit>(context, listen: listen);
  AuthCubit() : super(const AuthStateDefault());

  final repo = _AuthRepository();

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
}
