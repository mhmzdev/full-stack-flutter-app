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

part 'state.dart';
part 'states/_comment.dart';
part 'states/_create.dart';
part 'states/_delete.dart';
part 'states/_edit.dart';
part 'states/_fetch_all.dart';
part 'states/_like.dart';
part 'states/_share.dart';

part 'data_provider.dart';
part 'repository.dart';

class PostCubit extends Cubit<PostState> {
  static PostCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<PostCubit>(context, listen: listen);
  PostCubit() : super(const PostStateDefault());

  final repo = _PostRepository();

  void initUid() {
    emit(state.copyWith(uid: AppCache.uid));
  }

  void resetUid() {
    emit(state.copyWith(uid: null));
  }

  Future<void> fetchAll() async {
    emit(state.copyWith(
      fetchAll: PostFetchAllLoading(),
    ));
    try {
      final data = await repo.fetchAll();
      emit(state.copyWith(
        posts: data,
        fetchAll: const PostFetchAllSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        fetchAll: PostFetchAllFailed(message: e.toString()),
      ));
    }
  }

  Future<void> createPost(
    int uid,
    String caption, {
    bool? hasImage,
    String? imageURL,
    bool? hasVideo,
    String? videoURL,
  }) async {
    emit(state.copyWith(
      create: PostCreateLoading(),
    ));
    try {
      final data = await repo.createPost(
        uid,
        caption,
        hasImage,
        imageURL,
        hasVideo,
        videoURL,
      );

      state.posts!.add(data);

      emit(state.copyWith(
        create: const PostCreateSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        create: PostCreateFailed(message: e.toString()),
      ));
    }
  }

  Future<void> editPost(int postId, String caption) async {
    emit(state.copyWith(
      edit: PostEditLoading(),
    ));
    try {
      await repo.editPost(postId, caption);

      final post = state.posts!.firstWhere((post) => post.id == postId);
      final postIndex = state.posts!.indexOf(post);
      final updatedPost = post.copyWith(caption: caption);
      state.posts![postIndex] = updatedPost;

      emit(state.copyWith(
        edit: const PostEditSuccess(),
        posts: state.posts,
      ));
    } catch (e) {
      emit(state.copyWith(
        edit: PostEditFailed(message: e.toString()),
      ));
    }
  }

  Future<void> like(int postId, int uid) async {
    emit(state.copyWith(
      like: PostLikeLoading(),
    ));
    try {
      final post = state.posts!.firstWhere((element) => element.id == postId);
      final index = state.posts!.indexOf(post);

      bool doLike = true;

      if (post.likes.contains(uid)) {
        doLike = false;
      }

      final updatedPost = await repo.like(postId, uid, doLike);
      state.posts!.removeAt(index);
      state.posts!.insert(index, updatedPost);

      emit(state.copyWith(
        like: const PostLikeSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        like: PostLikeFailed(message: e.toString()),
      ));
    }
  }

  Future<void> comment(int postId, int uid, String content) async {
    emit(state.copyWith(
      comment: PostCommentLoading(),
    ));
    try {
      final post = state.posts!.firstWhere((element) => element.id == postId);
      final index = state.posts!.indexOf(post);

      final updatedPost = await repo.comment(postId, uid, content);
      state.posts!.removeAt(index);
      state.posts!.insert(index, updatedPost);

      emit(state.copyWith(
        comment: const PostCommentSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        comment: PostCommentFailed(message: e.toString()),
      ));
    }
  }

  Future<void> deletePost(int postId, String url) async {
    emit(state.copyWith(
      delete: PostDeleteLoading(),
    ));
    try {
      await repo.deletePost(postId, url);

      state.posts!.removeWhere(
        (post) => post.id == postId,
      );

      emit(state.copyWith(
        delete: const PostDeleteSuccess(),
      ));
    } catch (e) {
      emit(state.copyWith(
        delete: PostDeleteFailed(message: e.toString()),
      ));
    }
  }
}
