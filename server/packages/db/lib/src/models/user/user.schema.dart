part of 'user.dart';

extension UserRepositories on Database {
  UserRepository get users => UserRepository._(this);
}

abstract class UserRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<UserInsertRequest>,
        ModelRepositoryUpdate<UserUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory UserRepository._(Database db) = _UserRepository;

  Future<User?> queryUser(int id);
  Future<List<User>> queryUsers([QueryParams? params]);
}

class _UserRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<UserInsertRequest>,
        RepositoryUpdateMixin<UserUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements UserRepository {
  _UserRepository(super.db) : super(tableName: 'users', keyName: 'id');

  @override
  Future<User?> queryUser(int id) {
    return queryOne(id, UserQueryable());
  }

  @override
  Future<List<User>> queryUsers([QueryParams? params]) {
    return queryMany(UserQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<UserInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "users" ( "name", "email", "posts" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.name)}:text, ${values.add(r.email)}:text, ${values.add(r.posts)}:_int8 )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<UserUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "users"\n'
      'SET "name" = COALESCE(UPDATED."name", "users"."name"), "email" = COALESCE(UPDATED."email", "users"."email"), "posts" = COALESCE(UPDATED."posts", "users"."posts")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8, ${values.add(r.name)}:text, ${values.add(r.email)}:text, ${values.add(r.posts)}:_int8 )').join(', ')} )\n'
      'AS UPDATED("id", "name", "email", "posts")\n'
      'WHERE "users"."id" = UPDATED."id"',
      values.values,
    );
  }
}

class UserInsertRequest {
  UserInsertRequest({
    required this.name,
    required this.email,
    required this.posts,
  });

  String name;
  String email;
  List<int> posts;
}

class UserUpdateRequest {
  UserUpdateRequest({
    required this.id,
    this.name,
    this.email,
    this.posts,
  });

  int id;
  String? name;
  String? email;
  List<int>? posts;
}

class UserQueryable extends KeyedViewQueryable<User, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "users".*'
      'FROM "users"';

  @override
  String get tableAlias => 'users';

  @override
  User decode(TypedMap map) => UserView(
      id: map.get('id'),
      name: map.get('name'),
      email: map.get('email'),
      posts: map.getListOpt('posts') ?? const []);
}

class UserView with User {
  UserView({
    required this.id,
    required this.name,
    required this.email,
    required this.posts,
  });

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final List<int> posts;
}
