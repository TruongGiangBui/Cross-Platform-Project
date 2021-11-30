class Chat {
  final dynamic id;
  final dynamic owner;
  final dynamic guest;
  final dynamic guestname;
  final dynamic type;
  final dynamic lastmessage;
  final dynamic updateAt;

  Chat({
    this.id,
    this.owner,
    this.guest,
    this.guestname,
    this.type,
    this.lastmessage,
    this.updateAt
  });
  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id:json['_id'],
      owner: json['owner'],
      guest: json['guest'],
      guestname: json['guestname'],
      type: json['type'],
      lastmessage: json['lastmessage'],
      updateAt: json['updateAt']
    );
  }
}
