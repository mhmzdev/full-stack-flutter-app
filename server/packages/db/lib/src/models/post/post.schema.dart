part of 'post.dart';

extension PostRepositories on Database {
  PostRepository get posts => PostRepository._(this);
}

abstract class PostRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<PostInsertRequest>,
        ModelRepositoryUpdate<PostUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory PostRepository._(Database db) = _PostRepository;

  Future<Post?> queryPost(int id);
  Future<List<Post>> queryPosts([QueryParams? params]);
}

class _PostRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<PostInsertRequest>,
        RepositoryUpdateMixin<PostUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements PostRepository {
  _PostRepository(super.db) : super(tableName: 'posts', keyName: 'id');

  @override
  Future<Post?> queryPost(int id) {
    return queryOne(id, PostQueryable());
  }

  @override
  Future<List<Post>> queryPosts([QueryParams? params]) {
    return queryMany(PostQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<PostInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "posts" ( "uid", "caption", "has_image", "image_url", "has_video", "video_url", "likes", "comments", "created_at" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.uid)}:int8, ${values.add(r.caption)}:text, ${values.add(r.hasImage)}:boolean, ${values.add(r.imageUrl)}:text, ${values.add(r.hasVideo)}:boolean, ${values.add(r.videoUrl)}:text, ${values.add(r.likes)}:_int8, ${values.add(r.comments)}:_int8, ${values.add(r.createdAt)}:timestamp )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows
        .map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id']))
        .toList();

    return result;
  }

  @override
  Future<void> update(List<PostUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "posts"\n'
      'SET "uid" = COALESCE(UPDATED."uid", "posts"."uid"), "caption" = COALESCE(UPDATED."caption", "posts"."caption"), "has_image" = COALESCE(UPDATED."has_image", "posts"."has_image"), "image_url" = COALESCE(UPDATED."image_url", "posts"."image_url"), "has_video" = COALESCE(UPDATED."has_video", "posts"."has_video"), "video_url" = COALESCE(UPDATED."video_url", "posts"."video_url"), "likes" = COALESCE(UPDATED."likes", "posts"."likes"), "comments" = COALESCE(UPDATED."comments", "posts"."comments"), "created_at" = COALESCE(UPDATED."created_at", "posts"."created_at")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8::int8, ${values.add(r.uid)}:int8, ${values.add(r.caption)}:text, ${values.add(r.hasImage)}:boolean, ${values.add(r.imageUrl)}:text, ${values.add(r.hasVideo)}:boolean, ${values.add(r.videoUrl)}:text, ${values.add(r.likes)}:_int8, ${values.add(r.comments)}:_int8, ${values.add(r.createdAt)}::timestamp without time zone )').join(', ')} )\n'
      'AS UPDATED("id", "uid", "caption", "has_image", "image_url", "has_video", "video_url", "likes", "comments", "created_at")\n'
      'WHERE "posts"."id" = UPDATED."id"',
      values.values,
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

  int uid;
  String caption;
  bool? hasImage;
  String? imageUrl;
  bool? hasVideo;
  String? videoUrl;
  List<int> likes;
  List<int> comments;
  DateTime createdAt;
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

  int id;
  int? uid;
  String? caption;
  bool? hasImage;
  String? imageUrl;
  bool? hasVideo;
  String? videoUrl;
  List<int>? likes;
  List<int>? comments;
  DateTime? createdAt;
}

class PostQueryable extends KeyedViewQueryable<Post, int> {
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
  Post decode(TypedMap map) => PostView(
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

class PostView with Post {
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

  @override
  final int id;
  @override
  final int uid;
  @override
  final String caption;
  @override
  final bool? hasImage;
  @override
  final String? imageUrl;
  @override
  final bool? hasVideo;
  @override
  final String? videoUrl;
  @override
  final List<int> likes;
  @override
  final List<int> comments;
  @override
  final DateTime createdAt;
}
