class LoadBlogResult{
  final String? authorName;
  final int? commentAmount;
  final DateTime? dateCreated;
  final int? likeAmount;
  final int? readTime;
  final String? title;
  final String? topicId;
  final String? userId;

  LoadBlogResult({
    this.authorName,
    this.commentAmount,
    this.dateCreated,
    this.likeAmount,
    this.readTime,
    this.title,
    this.topicId,
    this.userId,
  });
}

