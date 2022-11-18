import 'package:pet_data/mapper/topic_data_mapper.dart';
import 'package:pet_data/networking/service_manager.dart';
import 'package:pet_domain/model/topic/topic.dart';
import 'package:pet_domain/model/topic/user_topic.dart';
import 'package:pet_domain/repository/topic_repository.dart';

class TopicRepositoryImpl extends TopicRepository {
  final ServiceManager _serviceManager;
  final TopicDataMapper _topicDataMapper;
  TopicRepositoryImpl(this._serviceManager,this._topicDataMapper);

  @override
  Future<List<LoadTopicResult>> loadAllTopic() async {
    final response = await _serviceManager.loadAllTopic();

    return _topicDataMapper.mapListTopicResponse(response);
  }

  @override
  Future<LoadUserTopicResult> loadUserTopic(String userId) async{
    final response = await _serviceManager.loadUserTopics(userId);

    return _topicDataMapper.mapUserTopicResponse(response);
  }
}
