class Message {
  final dynamic id;
  final dynamic sender;
  final dynamic sendername;
  final dynamic updateAt;
  final dynamic content;
  final dynamic senderavt;
  Message(
      {this.id,
      this.sender,
      this.sendername,
      this.updateAt,
      this.content,
      this.senderavt});
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        id: json['_id'],
        sender: json['user']['_id'],
        sendername: json['user']['username'],
        updateAt: json['updateAt'],
        content: json['content'],
        senderavt: json['user']['avatar']['fileName']);
  }
}
