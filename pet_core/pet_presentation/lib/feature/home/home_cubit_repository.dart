import 'package:get_it/get_it.dart';
import 'package:pet_domain/model/blog/blog.dart';
import 'package:pet_domain/model/topic/topic.dart';
import 'package:pet_domain/model/topic/user_topic.dart';
import 'package:pet_domain/repository/blog_repository.dart';
import 'package:pet_domain/repository/topic_repository.dart';

class HomeCubitRepository {
  late final TopicRepository _topicRepository;
  late final BlogRepository _blogRepository;

  HomeCubitRepository() {
    _topicRepository = GetIt.instance.get<TopicRepository>();
    _blogRepository = GetIt.instance.get<BlogRepository>();
  }

  Future<List<LoadTopicResult>> loadAllTopic() async {
    final result = await _topicRepository.loadAllTopic();

    return result;
  }


  Future<LoadUserTopicResult> loadUserTopic(String userId) async {
    final result = await _topicRepository.loadUserTopic(userId);

    return result;
  }



  Future<List<LoadBlogResult>> loadBlogs(List<String> topics) async {
    final result = await _blogRepository.loadBlogs(topics);

    return result;
  }
}
