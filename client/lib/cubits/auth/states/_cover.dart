part of '../cubit.dart';

@immutable
class CoverUploadState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.cover != b.cover;

  final String? message;

  const CoverUploadState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class CoverUploadDefault extends CoverUploadState {}

@immutable
class CoverUploadLoading extends CoverUploadState {}

@immutable
class CoverUploadSuccess extends CoverUploadState {
  const CoverUploadSuccess() : super();
}

@immutable
class CoverUploadFailed extends CoverUploadState {
  const CoverUploadFailed({super.message});
}
