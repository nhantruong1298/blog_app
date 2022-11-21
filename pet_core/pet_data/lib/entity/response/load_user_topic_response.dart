import 'package:json_annotation/json_annotation.dart';
part 'load_user_topic_response.g.dart';

@JsonSerializable()
class LoadUserTopicResponse {
  @JsonKey(name: "topics")
  final List<String>? topics;

  LoadUserTopicResponse({this.topics});
  static const fromJson = _$LoadUserTopicResponseFromJson;

  Map<String, dynamic> toJson() => _$LoadUserTopicResponseToJson(this);
}
