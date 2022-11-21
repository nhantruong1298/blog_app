// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_user_topic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadUserTopicResponse _$LoadUserTopicResponseFromJson(
        Map<String, dynamic> json) =>
    LoadUserTopicResponse(
      topics:
          (json['topics'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LoadUserTopicResponseToJson(
        LoadUserTopicResponse instance) =>
    <String, dynamic>{
      'topics': instance.topics,
    };
