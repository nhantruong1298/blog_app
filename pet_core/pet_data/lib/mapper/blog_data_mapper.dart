import 'package:pet_data/entity/response/load_blog_response.dart';
import 'package:pet_domain/model/blog/blog.dart';

class BlogDataMapper {
  List<LoadBlogResult> mapListBlogResponse(List<LoadBlogResponse> list) {
    final result = <LoadBlogResult>[];

    for (final item in list) {
      result.add(LoadBlogResult(
        authorName: item.authorName,
        commentAmount: item.commentAmount,
        dateCreated: item.dateCreated,
        likeAmount: item.likeAmount,
        readTime: item.readTime,
        title: item.title,
        topicId: item.topicId,
        userId: item.userId,
      ));
    }
    return result;
  }
}
