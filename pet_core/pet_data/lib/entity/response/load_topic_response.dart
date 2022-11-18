import 'package:json_annotation/json_annotation.dart';
part 'load_topic_response.g.dart';

@JsonSerializable()
class LoadTopicResponse {
  @JsonKey(name: "id")
  final String? topicId;
  
  final String? title;
  LoadTopicResponse({this.topicId, this.title});

  static const fromJson = _$LoadTopicResponseFromJson;

  Map<String, dynamic> toJson() => _$LoadTopicResponseToJson(this);
}
