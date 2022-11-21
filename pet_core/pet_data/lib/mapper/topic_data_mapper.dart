import 'package:pet_data/entity/response/load_topic_response.dart';
import 'package:pet_data/entity/response/load_user_topic_response.dart';
import 'package:pet_domain/model/topic/topic.dart';
import 'package:pet_domain/model/topic/user_topic.dart';

class TopicDataMapper {
  List<LoadTopicResult> mapListTopicResponse(List<LoadTopicResponse> list) {
    final result = <LoadTopicResult>[];
    for (LoadTopicResponse item in list) {
      result.add(
          LoadTopicResult(id: item.topicId ?? '', title: item.title ?? ''));
    }
    return result;
  }

  LoadUserTopicResult mapUserTopicResponse(LoadUserTopicResponse? response) {
    return LoadUserTopicResult(
      topics: response?.topics ?? [],
    );
  }
}
