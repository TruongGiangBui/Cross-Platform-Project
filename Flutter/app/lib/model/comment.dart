class Comment {
  final dynamic id;
  final dynamic postid;
  final dynamic content;
  final dynamic createAt;
  final dynamic authorid;
  final dynamic authorname;

  Comment(
      {
      this.id,
      this.postid,
      this.content,
      this.createAt,
      this.authorid,
      this.authorname});
  factory Comment.fromJson(Map<dynamic, dynamic> json) {
    return Comment(
        id: json['_id'],
        postid: json['post'],
        content: json['content'],
        createAt: json['createAt'],
        authorid: json['user']['_id'],
        authorname: json['user']['username']);
  }
}
