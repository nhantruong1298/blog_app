import 'package:pet_domain/model/blog/blog.dart';

abstract class BlogRepository {
  Future<List<LoadBlogResult>> loadBlogs(List<String> topics);
}
