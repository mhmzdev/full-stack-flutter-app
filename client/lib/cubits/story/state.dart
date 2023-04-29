part of 'cubit.dart';

// root-state
@immutable
class StoryState extends Equatable {
  final StoryFetchAllState fetchAll;
  final StoryCreateState create;
  final List<Story>? stories;

  const StoryState({
    required this.create,
    required this.fetchAll,
    this.stories,
  });

  @override
  List<Object?> get props => [
        // root-state-props
        create,
        fetchAll,
        stories,
      ];

  StoryState copyWith({
    StoryFetchAllState? fetchAll,
    StoryCreateState? create,
    List<Story>? stories,
  }) {
    return StoryState(
      create: create ?? this.create,
      fetchAll: fetchAll ?? this.fetchAll,
      stories: stories ?? this.stories,
    );
  }
}

@immutable
class StoryStateDefault extends StoryState {
  const StoryStateDefault()
      : super(
          // root-state-init
          create: const StoryCreateState(),
          fetchAll: const StoryFetchAllState(),
        );
}
