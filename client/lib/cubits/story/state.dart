part of 'cubit.dart';

// root-state
@immutable
class StoryState extends Equatable {
  final StoryFetchAllState fetchAll;
  final StoryCreateState create;
  final StoryDeleteState delete;
  final List<Story>? stories;

  const StoryState({
    required this.create,
    required this.delete,
    required this.fetchAll,
    this.stories,
  });

  @override
  List<Object?> get props => [
        // root-state-props
        delete,
        create,
        fetchAll,
        stories,
      ];

  StoryState copyWith({
    StoryFetchAllState? fetchAll,
    StoryDeleteState? delete,
    StoryCreateState? create,
    List<Story>? stories,
  }) {
    return StoryState(
      delete: delete ?? this.delete,
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
          delete: const StoryDeleteState(),
          create: const StoryCreateState(),
          fetchAll: const StoryFetchAllState(),
        );
}
