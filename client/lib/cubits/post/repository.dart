part of 'cubit.dart';

class _PostRepository {
  Future<List<Post>> fetchAll() => _PostProvider.fetchAll();
}
