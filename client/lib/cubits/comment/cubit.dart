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

class CommentCubit extends Cubit<CommentState> {
  static CommentCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<CommentCubit>(context, listen: listen);
  CommentCubit() : super(const CommentStateDefault());

  final repo = _CommentRepository();

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
}
