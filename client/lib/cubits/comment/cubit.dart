import 'dart:async';

import 'package:client/constants/constants.dart';
import 'package:client/services/api.dart';
import 'package:client/services/cache.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared/shared.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

part 'states/_fetch_all.dart';
part 'states/_delete.dart';

class CommentCubit extends Cubit<CommentState> {
  static CommentCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<CommentCubit>(context, listen: listen);
  CommentCubit() : super(const CommentStateDefault());

  final repo = _CommentRepository();

  void initUid() {
    emit(state.copyWith(uid: AppCache.uid));
  }

  void resetUid() {
    emit(state.copyWith(uid: null));
  }

  Future<void> fetchAll() async {
    emit(state.copyWith(
      fetchAll: CommentFetchAllLoading(),
    ));
    try {
      final data = await repo.fetchAll();
      emit(state.copyWith(
        fetchAll: const CommentFetchAllSuccess(),
        comments: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        fetchAll: CommentFetchAllFailed(message: e.toString()),
      ));
    }
  }

  Future<void> delete(int commentId, int postId) async {
    emit(state.copyWith(
      delete: CommentDeleteLoading(),
    ));
    try {
      await repo.delete(commentId, postId);
      state.comments!.removeWhere(
        (element) => element.id == commentId,
      );

      emit(state.copyWith(
        delete: const CommentDeleteSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        delete: CommentDeleteFailed(message: e.toString()),
      ));
    }
  }
}
