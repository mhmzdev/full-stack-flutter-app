part of '../cubit.dart';

@immutable
class DPUploadState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.dp != b.dp;

  final String? message;

  const DPUploadState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class DPUploadDefault extends DPUploadState {}

@immutable
class DPUploadLoading extends DPUploadState {}

@immutable
class DPUploadSuccess extends DPUploadState {
  const DPUploadSuccess() : super();
}

@immutable
class DPUploadFailed extends DPUploadState {
  const DPUploadFailed({super.message});
}
