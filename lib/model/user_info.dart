class UserInfo {
  final String phoneNumber;
  final String firstName;
  final String lastName;
  UserInfo.fromJason({required Map<String, dynamic> jason})
      : phoneNumber = jason['user']['phoneNumber'],
        firstName = jason['user']['firstName'],
        lastName = jason['user']['lastName'];
}
