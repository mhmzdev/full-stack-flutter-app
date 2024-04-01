import 'dart:async';

import 'package:client/constants/constants.dart';
import 'package:client/services/api.dart';
import 'package:client/services/cache.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared/shared.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

part 'states/_fetch_all.dart';
part 'states/_create.dart';
part 'states/_delete.dart';

class StoryCubit extends Cubit<StoryState> {
  static StoryCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<StoryCubit>(context, listen: listen);
  StoryCubit() : super(const StoryStateDefault());

  final repo = _StoryRepository();

  void initUid() {
    emit(state.copyWith(uid: AppCache.uid));
  }

  void resetUid() {
    emit(state.copyWith(uid: null));
  }

  Future<void> fetchAll() async {
    emit(state.copyWith(
      fetchAll: StoryFetchAllLoading(),
    ));
    try {
      final data = await repo.fetchAll();
      emit(state.copyWith(
        fetchAll: const StoryFetchAllSuccess(),
        stories: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        fetchAll: StoryFetchAllFailed(message: e.toString()),
      ));
    }
  }

  Future<void> createStory(
    int uid, {
    bool? hasImage,
    String? imageURL,
    bool? hasVideo,
    String? videoURL,
  }) async {
    emit(state.copyWith(
      create: StoryCreateLoading(),
    ));
    try {
      final data = await repo.createStory(
        uid,
        hasImage,
        imageURL,
        hasVideo,
        videoURL,
      );

      (state.stories ?? []).add(data);

      emit(state.copyWith(
        create: const StoryCreateSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        create: StoryCreateFailed(message: e.toString()),
      ));
    }
  }

  Future<void> deleteStory(int storyId, String url) async {
    emit(state.copyWith(
      delete: StoryDeleteLoading(),
    ));
    try {
      await repo.deleteStory(storyId, url);

      state.stories!.removeWhere(
        (story) => story.id == storyId,
      );

      emit(state.copyWith(
        delete: const StoryDeleteSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        delete: StoryDeleteFailed(message: e.toString()),
      ));
    }
  }
}
