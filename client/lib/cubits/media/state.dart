part of 'cubit.dart';

@immutable
class MediaState extends Equatable {
  final String? url;
  final String? message;

  const MediaState({
    this.message,
    this.url,
  });

  @override
  List<Object?> get props => [
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
  const UploadMediaSuccess({required String url}) : super(url: url);
}

@immutable
class UploadMediaFailed extends MediaState {
  const UploadMediaFailed({String? message}) : super(message: message);
}
