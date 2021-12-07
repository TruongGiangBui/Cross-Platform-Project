// Data Chat Screen
class Chat1 {
  late final String name, lastMessage, image, time;
  late final bool isActive;

  Chat1 ({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat1(
    name: "Nguyen Dinh Thang",
    lastMessage: "Hy vọng bạn làm tốt",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
  ),

  Chat1(
    name: "Dao Minh Khanh",
    lastMessage: "Xin chao toi la Khanh DM",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
  ),

  Chat1(
    name: "Bui Truong Giang",
    lastMessage: "Hello xin chao moi nguoi",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: true,
  ),

  Chat1(
    name: "Nguyen Tran Khang",
    lastMessage: "Mai hop may gio the nhi",
    image: "assets/images/user_4.png",
    time: "4d ago",
    isActive: true,
  ),

  Chat1(
    name: "Minh Hoang",
    lastMessage: "Where are you from ?",
    image: "assets/images/user_5.png",
    time: "5m ago",
    isActive: true,
  ),

  Chat1 (
    name: "Le Dinh Hieu",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "1m ago",
    isActive: true,
  ),

  Chat1(
    name: "Esther Howard",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat1(
    name: "Ralph Edwards",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
  ),
];