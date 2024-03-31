// ignore_for_file: annotate_overrides

part of 'story.dart';

extension StoryRepositories on Session {
  StoryRepository get stories => StoryRepository._(this);
}

abstract class StoryRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<StoryInsertRequest>,
        ModelRepositoryUpdate<StoryUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory StoryRepository._(Session db) = _StoryRepository;

  Future<StoryView?> queryStory(int id);
  Future<List<StoryView>> queryStorys([QueryParams? params]);
}

class _StoryRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<StoryInsertRequest>,
        RepositoryUpdateMixin<StoryUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements StoryRepository {
  _StoryRepository(super.db) : super(tableName: 'stories', keyName: 'id');

  @override
  Future<StoryView?> queryStory(int id) {
    return queryOne(id, StoryViewQueryable());
  }

  @override
  Future<List<StoryView>> queryStorys([QueryParams? params]) {
    return queryMany(StoryViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<StoryInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.execute(
      Sql.named(
          'INSERT INTO "stories" ( "uid", "has_image", "image_url", "has_video", "video_url", "created_at" )\n'
          'VALUES ${requests.map((r) => '( ${values.add(r.uid)}:int8, ${values.add(r.hasImage)}:boolean, ${values.add(r.imageUrl)}:text, ${values.add(r.hasVideo)}:boolean, ${values.add(r.videoUrl)}:text, ${values.add(r.createdAt)}:timestamp )').join(', ')}\n'
          'RETURNING "id"'),
      parameters: values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<StoryUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.execute(
      Sql.named('UPDATE "stories"\n'
          'SET "uid" = COALESCE(UPDATED."uid", "stories"."uid"), "has_image" = COALESCE(UPDATED."has_image", "stories"."has_image"), "image_url" = COALESCE(UPDATED."image_url", "stories"."image_url"), "has_video" = COALESCE(UPDATED."has_video", "stories"."has_video"), "video_url" = COALESCE(UPDATED."video_url", "stories"."video_url"), "created_at" = COALESCE(UPDATED."created_at", "stories"."created_at")\n'
          'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8::int8, ${values.add(r.uid)}:int8::int8, ${values.add(r.hasImage)}:boolean::boolean, ${values.add(r.imageUrl)}:text::text, ${values.add(r.hasVideo)}:boolean::boolean, ${values.add(r.videoUrl)}:text::text, ${values.add(r.createdAt)}:timestamp::timestamp )').join(', ')} )\n'
          'AS UPDATED("id", "uid", "has_image", "image_url", "has_video", "video_url", "created_at")\n'
          'WHERE "stories"."id" = UPDATED."id"'),
      parameters: values.values,
    );
  }
}

class StoryInsertRequest {
  StoryInsertRequest({
    required this.uid,
    this.hasImage,
    this.imageUrl,
    this.hasVideo,
    this.videoUrl,
    required this.createdAt,
  });

  final int uid;
  final bool? hasImage;
  final String? imageUrl;
  final bool? hasVideo;
  final String? videoUrl;
  final DateTime createdAt;
}

class StoryUpdateRequest {
  StoryUpdateRequest({
    required this.id,
    this.uid,
    this.hasImage,
    this.imageUrl,
    this.hasVideo,
    this.videoUrl,
    this.createdAt,
  });

  final int id;
  final int? uid;
  final bool? hasImage;
  final String? imageUrl;
  final bool? hasVideo;
  final String? videoUrl;
  final DateTime? createdAt;
}

class StoryViewQueryable extends KeyedViewQueryable<StoryView, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "stories".*'
      'FROM "stories"';

  @override
  String get tableAlias => 'stories';

  @override
  StoryView decode(TypedMap map) => StoryView(
      id: map.get('id'),
      uid: map.get('uid'),
      hasImage: map.getOpt('has_image'),
      imageUrl: map.getOpt('image_url'),
      hasVideo: map.getOpt('has_video'),
      videoUrl: map.getOpt('video_url'),
      createdAt: map.get('created_at'));
}

class StoryView {
  StoryView({
    required this.id,
    required this.uid,
    this.hasImage,
    this.imageUrl,
    this.hasVideo,
    this.videoUrl,
    required this.createdAt,
  });

  final int id;
  final int uid;
  final bool? hasImage;
  final String? imageUrl;
  final bool? hasVideo;
  final String? videoUrl;
  final DateTime createdAt;
}
