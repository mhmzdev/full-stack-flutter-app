// ignore_for_file: annotate_overrides

part of 'user.dart';

extension UserRepositories on Session {
  UserRepository get users => UserRepository._(this);
}

abstract class UserRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<UserInsertRequest>,
        ModelRepositoryUpdate<UserUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory UserRepository._(Session db) = _UserRepository;

  Future<UserView?> queryUser(int id);
  Future<List<UserView>> queryUsers([QueryParams? params]);
}

class _UserRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<UserInsertRequest>,
        RepositoryUpdateMixin<UserUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements UserRepository {
  _UserRepository(super.db) : super(tableName: 'users', keyName: 'id');

  @override
  Future<UserView?> queryUser(int id) {
    return queryOne(id, UserViewQueryable());
  }

  @override
  Future<List<UserView>> queryUsers([QueryParams? params]) {
    return queryMany(UserViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<UserInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.execute(
      Sql.named(
          'INSERT INTO "users" ( "first_name", "followers", "following", "posts", "stories", "last_name", "username", "email", "password", "bio", "birthday", "image_url", "cover_url" )\n'
          'VALUES ${requests.map((r) => '( ${values.add(r.firstName)}:text, ${values.add(r.followers)}:_int8, ${values.add(r.following)}:_int8, ${values.add(r.posts)}:_int8, ${values.add(r.stories)}:_int8, ${values.add(r.lastName)}:text, ${values.add(r.username)}:text, ${values.add(r.email)}:text, ${values.add(r.password)}:text, ${values.add(r.bio)}:text, ${values.add(r.birthday)}:timestamp, ${values.add(r.imageURL)}:text, ${values.add(r.coverURL)}:text )').join(', ')}\n'
          'RETURNING "id"'),
      parameters: values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<UserUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.execute(
      Sql.named('UPDATE "users"\n'
          'SET "first_name" = COALESCE(UPDATED."first_name", "users"."first_name"), "followers" = COALESCE(UPDATED."followers", "users"."followers"), "following" = COALESCE(UPDATED."following", "users"."following"), "posts" = COALESCE(UPDATED."posts", "users"."posts"), "stories" = COALESCE(UPDATED."stories", "users"."stories"), "last_name" = COALESCE(UPDATED."last_name", "users"."last_name"), "username" = COALESCE(UPDATED."username", "users"."username"), "email" = COALESCE(UPDATED."email", "users"."email"), "password" = COALESCE(UPDATED."password", "users"."password"), "bio" = COALESCE(UPDATED."bio", "users"."bio"), "birthday" = COALESCE(UPDATED."birthday", "users"."birthday"), "image_url" = COALESCE(UPDATED."image_url", "users"."image_url"), "cover_url" = COALESCE(UPDATED."cover_url", "users"."cover_url")\n'
          'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8::int8, ${values.add(r.firstName)}:text::text, ${values.add(r.followers)}:_int8::_int8, ${values.add(r.following)}:_int8::_int8, ${values.add(r.posts)}:_int8::_int8, ${values.add(r.stories)}:_int8::_int8, ${values.add(r.lastName)}:text::text, ${values.add(r.username)}:text::text, ${values.add(r.email)}:text::text, ${values.add(r.password)}:text::text, ${values.add(r.bio)}:text::text, ${values.add(r.birthday)}:timestamp::timestamp, ${values.add(r.imageURL)}:text::text, ${values.add(r.coverURL)}:text::text )').join(', ')} )\n'
          'AS UPDATED("id", "first_name", "followers", "following", "posts", "stories", "last_name", "username", "email", "password", "bio", "birthday", "image_url", "cover_url")\n'
          'WHERE "users"."id" = UPDATED."id"'),
      parameters: values.values,
    );
  }
}

class UserInsertRequest {
  UserInsertRequest({
    required this.firstName,
    required this.followers,
    required this.following,
    required this.posts,
    required this.stories,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    this.bio,
    this.birthday,
    required this.imageURL,
    required this.coverURL,
  });

  final String firstName;
  final List<int> followers;
  final List<int> following;
  final List<int> posts;
  final List<int> stories;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final String? bio;
  final DateTime? birthday;
  final String imageURL;
  final String coverURL;
}

class UserUpdateRequest {
  UserUpdateRequest({
    required this.id,
    this.firstName,
    this.followers,
    this.following,
    this.posts,
    this.stories,
    this.lastName,
    this.username,
    this.email,
    this.password,
    this.bio,
    this.birthday,
    this.imageURL,
    this.coverURL,
  });

  final int id;
  final String? firstName;
  final List<int>? followers;
  final List<int>? following;
  final List<int>? posts;
  final List<int>? stories;
  final String? lastName;
  final String? username;
  final String? email;
  final String? password;
  final String? bio;
  final DateTime? birthday;
  final String? imageURL;
  final String? coverURL;
}

class UserViewQueryable extends KeyedViewQueryable<UserView, int> {
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
  UserView decode(TypedMap map) => UserView(
      id: map.get('id'),
      firstName: map.get('first_name'),
      followers: map.getListOpt('followers') ?? const [],
      following: map.getListOpt('following') ?? const [],
      posts: map.getListOpt('posts') ?? const [],
      stories: map.getListOpt('stories') ?? const [],
      lastName: map.get('last_name'),
      username: map.get('username'),
      email: map.get('email'),
      password: map.get('password'),
      bio: map.getOpt('bio'),
      birthday: map.getOpt('birthday'),
      imageURL: map.get('image_url'),
      coverURL: map.get('cover_url'));
}

class UserView {
  UserView({
    required this.id,
    required this.firstName,
    required this.followers,
    required this.following,
    required this.posts,
    required this.stories,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    this.bio,
    this.birthday,
    required this.imageURL,
    required this.coverURL,
  });

  final int id;
  final String firstName;
  final List<int> followers;
  final List<int> following;
  final List<int> posts;
  final List<int> stories;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final String? bio;
  final DateTime? birthday;
  final String imageURL;
  final String coverURL;
}
