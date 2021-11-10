
class User{
   String token;
   String username;
   String phoneNumber;
   String password;
   String firstName;
   String lastName;
   String gender;
   DateTime birthday;
   String description;
   String address;
   String city;
   String country;
   String imagePath;

  User(this.token, {
    required this.username, required this.phoneNumber,
    required this.password, required this.firstName,
    required this.lastName, required this.gender,
    required this.birthday, required this.description,
    required this.address, required this.city,
    required this.country, required this.imagePath
  });
  
  void setUserName(String value) => username = value;
   void setToken(String value) => token = value;
   void setPassword(String value) => password = value;
   void setFirstName(String value) => firstName = value;
   void setLastName(String value) => lastName = value;
   void setGender(String value) => gender = value;
   void setBirthday(DateTime value) => birthday = value;
   void setDescription(String value) => description = value;
   void setAddress(String value) => address = value;
   void setCity(String value) => city = value;
   void setCountry(String value) => country = value;
   void setImagePath(String value) => imagePath = value;
}

