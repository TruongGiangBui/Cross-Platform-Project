
class User{
  final String username;
  final String phoneNumber;
  final String password;
  final String firstName;
  final String lastName;
  final String gender;
  final DateTime birthday;
  final String description;
  final String address;
  final String city;
  final String country;
  final String imagePath;

  User({
    required this.username, required this.phoneNumber,
    required this.password, required this.firstName,
    required this.lastName, required this.gender,
    required this.birthday, required this.description,
    required this.address, required this.city,
    required this.country, required this.imagePath
  });

  set username(String value) => value;
  set phoneNumber(String value) => value;
  set password(String value) => value;
  set firstName(String value) => value;
  set lastName(String value) => value;
  set gender(String value) => value;
  set birthday(DateTime value) => value;
  set description(String value) => value;
  set address(String value) => value;
  set city(String value) => value;
  set country(String value) => value;
  set imagePath(String value) => value;



}

