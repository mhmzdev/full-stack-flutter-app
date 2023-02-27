part of 'comment.dart';

extension CommentRepositories on Database {
  CommentRepository get comments => CommentRepository._(this);
}

abstract class CommentRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<CommentInsertRequest>,
        ModelRepositoryUpdate<CommentUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory CommentRepository._(Database db) = _CommentRepository;

  Future<Comment?> queryComment(int id);
  Future<List<Comment>> queryComments([QueryParams? params]);
}

class _CommentRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<CommentInsertRequest>,
        RepositoryUpdateMixin<CommentUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements CommentRepository {
  _CommentRepository(super.db) : super(tableName: 'comments', keyName: 'id');

  @override
  Future<Comment?> queryComment(int id) {
    return queryOne(id, CommentQueryable());
  }

  @override
  Future<List<Comment>> queryComments([QueryParams? params]) {
    return queryMany(CommentQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<CommentInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "comments" ( "uid", "content" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.uid)}:int8, ${values.add(r.content)}:text )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<CommentUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "comments"\n'
      'SET "uid" = COALESCE(UPDATED."uid", "comments"."uid"), "content" = COALESCE(UPDATED."content", "comments"."content")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8, ${values.add(r.uid)}:int8, ${values.add(r.content)}:text )').join(', ')} )\n'
      'AS UPDATED("id", "uid", "content")\n'
      'WHERE "comments"."id" = UPDATED."id"',
      values.values,
    );
  }
}

class CommentInsertRequest {
  CommentInsertRequest({
    required this.uid,
    required this.content,
  });

  int uid;
  String content;
}

class CommentUpdateRequest {
  CommentUpdateRequest({
    required this.id,
    this.uid,
    this.content,
  });

  int id;
  int? uid;
  String? content;
}

class CommentQueryable extends KeyedViewQueryable<Comment, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "comments".*'
      'FROM "comments"';

  @override
  String get tableAlias => 'comments';

  @override
  Comment decode(TypedMap map) =>
      CommentView(id: map.get('id'), uid: map.get('uid'), content: map.get('content'));
}

class CommentView with Comment {
  CommentView({
    required this.id,
    required this.uid,
    required this.content,
  });

  @override
  final int id;
  @override
  final int uid;
  @override
  final String content;
}
