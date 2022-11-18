// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_blog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadBlogResponse _$LoadBlogResponseFromJson(Map<String, dynamic> json) =>
    LoadBlogResponse(
      authorName: json['authorName'] as String?,
      commentAmount: json['commentAmount'] as int?,
      dateCreated: json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String),
      likeAmount: json['likeAmount'] as int?,
      readTime: json['readTime'] as int?,
      title: json['title'] as String?,
      topicId: json['topicId'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$LoadBlogResponseToJson(LoadBlogResponse instance) =>
    <String, dynamic>{
      'authorName': instance.authorName,
      'commentAmount': instance.commentAmount,
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'likeAmount': instance.likeAmount,
      'readTime': instance.readTime,
      'title': instance.title,
      'topicId': instance.topicId,
      'userId': instance.userId,
    };
