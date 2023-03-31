import 'dart:async';
import 'dart:io';

import 'package:client/cubits/auth/cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class MediaCubit extends Cubit<MediaState> {
  static MediaCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<MediaCubit>(context, listen: listen);

  MediaCubit() : super(UploadMediaDefault());

  final repo = _MediaRepository();

  Future<void> uploadMedia(
    User user,
    File file,
    PictureType type,
  ) async {
    emit(const UploadMediaLoading());
    try {
      final url = await repo.uploadMedia(user, file, type);

      emit(UploadMediaSuccess(url: url));
    } catch (e) {
      emit(UploadMediaFailed(message: e.toString()));
    }
  }
}
// end-cubit
