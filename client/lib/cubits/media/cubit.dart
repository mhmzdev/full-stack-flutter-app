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

      emit(
        UploadMediaSuccess(url: url, pictureType: type),
      );
    } catch (e) {
      emit(UploadMediaFailed(message: e.toString()));
    }
  }

  Future<void> uploadDP(
    User user,
    File file,
  ) async {
    emit(const UploadDPLoading());
    try {
      final url = await repo.uploadMedia(user, file, PictureType.dp);

      emit(UploadDPSuccess(url: url));
    } catch (e) {
      emit(UploadDPFailed(message: e.toString()));
    }
  }

  Future<void> uploadCover(
    User user,
    File file,
  ) async {
    emit(const UploadCoverLoading());
    try {
      final url = await repo.uploadMedia(user, file, PictureType.cover);

      emit(UploadCoverSuccess(url: url));
    } catch (e) {
      emit(UploadCoverFailed(message: e.toString()));
    }
  }

  void removeMedia(String path) {
    if (path.isEmpty) return;
    
    FirebaseStorage.instance.refFromURL(path).delete();
  }
}
// end-cubit
