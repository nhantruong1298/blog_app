import 'package:pet_domain/model/topic/topic.dart';
import 'package:pet_domain/model/topic/user_topic.dart';

abstract class TopicRepository {
  Future<List<LoadTopicResult>> loadAllTopic();

  Future<LoadUserTopicResult> loadUserTopic(String userId);
}
