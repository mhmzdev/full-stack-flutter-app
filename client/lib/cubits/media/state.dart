part of 'cubit.dart';

@immutable
class MediaState extends Equatable {
  final String? url;
  final PictureType? pictureType;
  final String? message;

  const MediaState({
    this.pictureType,
    this.message,
    this.url,
  });

  @override
  List<Object?> get props => [
        pictureType,
        message,
        url,
      ];
}

@immutable
class UploadMediaDefault extends MediaState {}

@immutable
class UploadMediaLoading extends MediaState {
  const UploadMediaLoading();
}

@immutable
class UploadMediaSuccess extends MediaState {
  const UploadMediaSuccess({
    required String url,
    PictureType? pictureType,
  }) : super(
          url: url,
          pictureType: pictureType,
        );
}

@immutable
class UploadMediaFailed extends MediaState {
  const UploadMediaFailed({String? message}) : super(message: message);
}

@immutable
class UploadDPLoading extends MediaState {
  const UploadDPLoading();
}

@immutable
class UploadDPSuccess extends MediaState {
  const UploadDPSuccess({required String url})
      : super(
          url: url,
          pictureType: PictureType.dp,
        );
}

@immutable
class UploadDPFailed extends MediaState {
  const UploadDPFailed({String? message}) : super(message: message);
}

@immutable
class UploadCoverLoading extends MediaState {
  const UploadCoverLoading();
}

@immutable
class UploadCoverSuccess extends MediaState {
  const UploadCoverSuccess({required String url})
      : super(
          url: url,
          pictureType: PictureType.cover,
        );
}

@immutable
class UploadCoverFailed extends MediaState {
  const UploadCoverFailed({String? message}) : super(message: message);
}
