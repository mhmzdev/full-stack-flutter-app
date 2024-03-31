---
to: lib/cubits/<%= h.changeCase.snake(name) %>/state.dart
---
<% pascal = h.changeCase.pascal(name) %>
part of 'cubit.dart';

@immutable
class <%= pascal %>State extends Equatable {
  final <%= h.changeCase.pascal(model) %>? data;
  final String? message;

  const <%= pascal %>State({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message];
}

@immutable
class <%= pascal %>Default extends <%= pascal %>State {}

@immutable
class <%= pascal %>FetchLoading extends <%= pascal %>State {
  const <%= pascal %>FetchLoading();
}

@immutable
class <%= pascal %>FetchSuccess extends <%= pascal %>State {
    const <%= pascal %>FetchSuccess({super.data});
}

@immutable
class <%= pascal %>FetchFailed extends <%= pascal %>State {
    const <%= pascal %>FetchFailed({super.message});
}