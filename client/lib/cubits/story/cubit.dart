import 'dart:async';

import 'package:client/constants/constants.dart';
import 'package:client/services/api.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared/shared.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

part 'states/_fetch_all.dart';
part 'states/_create.dart';

class StoryCubit extends Cubit<StoryState> {
  static StoryCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<StoryCubit>(context, listen: listen);
  StoryCubit() : super(const StoryStateDefault());

  final repo = _StoryRepository();

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
}
