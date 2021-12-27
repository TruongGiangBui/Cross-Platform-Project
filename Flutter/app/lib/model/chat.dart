class Chat {
  final dynamic id;
  final dynamic owner;
  final dynamic guest;
  final dynamic guestavt;
  final dynamic guestname;
  final dynamic type;
  final dynamic updateAt;

  Chat(
      {this.id,
      this.owner,
      this.guest,
      this.guestavt,
      this.guestname,
      this.type,
      this.updateAt});
  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
        id: json['_id'],
        owner: json['owner'],
        guest: json['guest'],
        guestavt: json['guestavt']['fileName'],
        guestname: json['guestname'],
        type: json['type'],
        updateAt: json['updateAt']);
  }
}
