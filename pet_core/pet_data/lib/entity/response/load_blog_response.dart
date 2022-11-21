import 'package:json_annotation/json_annotation.dart';
part 'load_blog_response.g.dart';

@JsonSerializable()
class LoadBlogResponse {
  final String? authorName;
  final int? commentAmount;
  final DateTime? dateCreated;
  final int? likeAmount;
  final int? readTime;
  final String? title;
  final String? topicId;
  final String? userId;

  LoadBlogResponse({
    this.authorName,
    this.commentAmount,
    this.dateCreated,
    this.likeAmount,
    this.readTime,
    this.title,
    this.topicId,
    this.userId,
  });

  static const fromJson = _$LoadBlogResponseFromJson;

  Map<String, dynamic> toJson() => _$LoadBlogResponseToJson(this);
}
