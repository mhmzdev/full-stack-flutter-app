part of 'cubit.dart';

// root-state
@immutable
class StoryState extends Equatable {
  final StoryFetchAllState fetchAll;
  final List<Story>? stories;

  const StoryState({
    required this.fetchAll,
    this.stories,
  });

  @override
  List<Object?> get props => [
        // root-state-props
        fetchAll,
        stories,
      ];

  StoryState copyWith({
    StoryFetchAllState? fetchAll,
    List<Story>? stories,
  }) {
    return StoryState(
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
          fetchAll: const StoryFetchAllState(),
        );
}
