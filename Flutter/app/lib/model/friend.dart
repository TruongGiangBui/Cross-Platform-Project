class Friend {
  final dynamic id;
  final dynamic username;
  final dynamic avt;
 

  Friend({
    this.id,
    this.username,
    this.avt,
  });
  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      id:json['_id'],
      username: json['username'],
      avt: json['avatar']['fileName']
    );
  }
}