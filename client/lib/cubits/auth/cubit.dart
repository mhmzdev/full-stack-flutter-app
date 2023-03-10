import 'dart:async';
import 'dart:io';

import 'package:client/constants/constants.dart';
import 'package:client/services/api.dart';
import 'package:client/services/cache.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared/shared.dart';

part '_dp_state.dart';
part '_cover_state.dart';
part '_login_state.dart';
part '_fetch_state.dart';
part '_logout_state.dart';
part '_update_state.dart';
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

  Future<void> update(
    int uid,
    String firstName,
    String lastName,
    String username,
    String newUserName,
    String bio,
    DateTime birthday,
  ) async {
    emit(state.copyWith(
      update: AuthUpdateLoading(),
    ));
    try {
      final data = await repo.update(
        uid,
        firstName,
        lastName,
        username,
        newUserName,
        bio,
        birthday,
      );

      emit(state.copyWith(
        user: data,
        update: const AuthUpdateSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        update: AuthUpdateFailed(message: e.toString()),
      ));
    }
  }

  Future<void> uploadProfilePhoto(File? file) async {
    emit(state.copyWith(
      dp: DPUploadLoading(),
    ));

    try {
      final url = await repo.uploadMedia(state.user!, file, PictureType.dp);
      final user = await repo.updatePhoto(state.user!.id, url, true);

      emit(state.copyWith(
        user: user,
        dp: const DPUploadSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        dp: DPUploadFailed(message: e.toString()),
      ));
    }
  }

  Future<void> uploadCoverPhoto(File? file) async {
    emit(state.copyWith(
      cover: CoverUploadLoading(),
    ));

    try {
      final url = await repo.uploadMedia(state.user!, file, PictureType.cover);
      final user = await repo.updatePhoto(state.user!.id, url, false);

      emit(state.copyWith(
        user: user,
        cover: const CoverUploadSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        cover: CoverUploadFailed(message: e.toString()),
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
