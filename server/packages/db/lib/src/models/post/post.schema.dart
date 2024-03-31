// ignore_for_file: annotate_overrides

part of 'post.dart';

extension PostRepositories on Session {
  PostRepository get posts => PostRepository._(this);
}

abstract class PostRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<PostInsertRequest>,
        ModelRepositoryUpdate<PostUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory PostRepository._(Session db) = _PostRepository;

  Future<PostView?> queryPost(int id);
  Future<List<PostView>> queryPosts([QueryParams? params]);
}

class _PostRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<PostInsertRequest>,
        RepositoryUpdateMixin<PostUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements PostRepository {
  _PostRepository(super.db) : super(tableName: 'posts', keyName: 'id');

  @override
  Future<PostView?> queryPost(int id) {
    return queryOne(id, PostViewQueryable());
  }

  @override
  Future<List<PostView>> queryPosts([QueryParams? params]) {
    return queryMany(PostViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<PostInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.execute(
      Sql.named(
          'INSERT INTO "posts" ( "uid", "caption", "has_image", "image_url", "has_video", "video_url", "likes", "comments", "created_at" )\n'
          'VALUES ${requests.map((r) => '( ${values.add(r.uid)}:int8, ${values.add(r.caption)}:text, ${values.add(r.hasImage)}:boolean, ${values.add(r.imageUrl)}:text, ${values.add(r.hasVideo)}:boolean, ${values.add(r.videoUrl)}:text, ${values.add(r.likes)}:_int8, ${values.add(r.comments)}:_int8, ${values.add(r.createdAt)}:timestamp )').join(', ')}\n'
          'RETURNING "id"'),
      parameters: values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<PostUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.execute(
      Sql.named('UPDATE "posts"\n'
          'SET "uid" = COALESCE(UPDATED."uid", "posts"."uid"), "caption" = COALESCE(UPDATED."caption", "posts"."caption"), "has_image" = COALESCE(UPDATED."has_image", "posts"."has_image"), "image_url" = COALESCE(UPDATED."image_url", "posts"."image_url"), "has_video" = COALESCE(UPDATED."has_video", "posts"."has_video"), "video_url" = COALESCE(UPDATED."video_url", "posts"."video_url"), "likes" = COALESCE(UPDATED."likes", "posts"."likes"), "comments" = COALESCE(UPDATED."comments", "posts"."comments"), "created_at" = COALESCE(UPDATED."created_at", "posts"."created_at")\n'
          'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8::int8, ${values.add(r.uid)}:int8::int8, ${values.add(r.caption)}:text::text, ${values.add(r.hasImage)}:boolean::boolean, ${values.add(r.imageUrl)}:text::text, ${values.add(r.hasVideo)}:boolean::boolean, ${values.add(r.videoUrl)}:text::text, ${values.add(r.likes)}:_int8::_int8, ${values.add(r.comments)}:_int8::_int8, ${values.add(r.createdAt)}:timestamp::timestamp )').join(', ')} )\n'
          'AS UPDATED("id", "uid", "caption", "has_image", "image_url", "has_video", "video_url", "likes", "comments", "created_at")\n'
          'WHERE "posts"."id" = UPDATED."id"'),
      parameters: values.values,
    );
  }
}

class PostInsertRequest {
  PostInsertRequest({
    required this.uid,
    required this.caption,
    this.hasImage,
    this.imageUrl,
    this.hasVideo,
    this.videoUrl,
    required this.likes,
    required this.comments,
    required this.createdAt,
  });

  final int uid;
  final String caption;
  final bool? hasImage;
  final String? imageUrl;
  final bool? hasVideo;
  final String? videoUrl;
  final List<int> likes;
  final List<int> comments;
  final DateTime createdAt;
}

class PostUpdateRequest {
  PostUpdateRequest({
    required this.id,
    this.uid,
    this.caption,
    this.hasImage,
    this.imageUrl,
    this.hasVideo,
    this.videoUrl,
    this.likes,
    this.comments,
    this.createdAt,
  });

  final int id;
  final int? uid;
  final String? caption;
  final bool? hasImage;
  final String? imageUrl;
  final bool? hasVideo;
  final String? videoUrl;
  final List<int>? likes;
  final List<int>? comments;
  final DateTime? createdAt;
}

class PostViewQueryable extends KeyedViewQueryable<PostView, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "posts".*'
      'FROM "posts"';

  @override
  String get tableAlias => 'posts';

  @override
  PostView decode(TypedMap map) => PostView(
      id: map.get('id'),
      uid: map.get('uid'),
      caption: map.get('caption'),
      hasImage: map.getOpt('has_image'),
      imageUrl: map.getOpt('image_url'),
      hasVideo: map.getOpt('has_video'),
      videoUrl: map.getOpt('video_url'),
      likes: map.getListOpt('likes') ?? const [],
      comments: map.getListOpt('comments') ?? const [],
      createdAt: map.get('created_at'));
}

class PostView {
  PostView({
    required this.id,
    required this.uid,
    required this.caption,
    this.hasImage,
    this.imageUrl,
    this.hasVideo,
    this.videoUrl,
    required this.likes,
    required this.comments,
    required this.createdAt,
  });

  final int id;
  final int uid;
  final String caption;
  final bool? hasImage;
  final String? imageUrl;
  final bool? hasVideo;
  final String? videoUrl;
  final List<int> likes;
  final List<int> comments;
  final DateTime createdAt;
}
