import 'dart:async';

import 'package:client/constants/constants.dart';
import 'package:client/services/api.dart';
import 'package:client/services/cache.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared/shared.dart';

part 'states/_dp.dart';
part 'states/_follow.dart';
part 'states/_cover.dart';
part 'states/_login.dart';
part 'states/_fetch.dart';
part 'states/_logout.dart';
part 'states/_update.dart';
part 'states/_register.dart';
part 'states/_fetch_all.dart';

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
      await auth.FirebaseAuth.instance.signOut();
      AppCache.reset();

      emit(state.copyWith(
        fetch: AuthFetchFailed(message: e.toString()),
      ));
    }
  }

  Future<void> fetchAll() async {
    emit(state.copyWith(
      fetchAll: AuthFetchAllLoading(),
    ));
    try {
      final data = await repo.fetchAll();

      emit(state.copyWith(
        users: data,
        fetchAll: const AuthFetchAllSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        fetchAll: AuthFetchAllFailed(message: e.toString()),
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

      final user = data.data;

      AppCache.setUid(user.id);
      AppCache.setToken(data.token);

      emit(state.copyWith(
        user: data.data,
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
    String firstName,
    String lastName,
    String username,
    String newUserName,
    String bio,
    DateTime? birthday,
  ) async {
    emit(state.copyWith(
      update: AuthUpdateLoading(),
    ));
    try {
      final data = await repo.update(
        state.user!.id,
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

  Future<void> uploadProfilePhoto(String url) async {
    emit(state.copyWith(
      dp: DPUploadLoading(),
    ));

    try {
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

  Future<void> uploadCoverPhoto(String url) async {
    emit(state.copyWith(
      cover: CoverUploadLoading(),
    ));

    try {
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
      AppCache.reset();
      await auth.FirebaseAuth.instance.signOut();

      emit(state.copyWith(
        logout: const AuthLogoutSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        logout: AuthLogoutFailed(message: e.toString()),
      ));
    }
  }

  Future<void> follow(int uid, int userToBeFollowedId,
      [bool removeFollower = false]) async {
    emit(state.copyWith(
      follow: FollowLoading(),
    ));

    try {
      await repo.follow(uid, userToBeFollowedId, removeFollower);

      emit(state.copyWith(
        follow: const FollowSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        follow: FollowFailed(message: e.toString()),
      ));
    }
  }
}
