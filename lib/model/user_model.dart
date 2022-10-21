class User {
  late int userID;
  late String userName;
  late String email;
  late String password;
  late String phoneNumber;
  late String address;
  late String imageProfile;

  User(
      {required this.userID,
      required this.userName,
      required this.address,
      required this.email,
      required this.imageProfile,
      required this.password,
      required this.phoneNumber});
}

List<User> listUserInfo = [
  User(
      userID: 2234545,
      userName: 'Pha Phanna',
      address: 'Kompong Chhnang',
      email: 'phaphanna55@gmail.com',
      imageProfile: '1.jpeg',
      password: 'phanna1234',
      phoneNumber: '0962987277'),
  User(
      userID: 2234545,
      userName: 'Phalla',
      address: 'Kompong Chhnang',
      email: 'ABCD@gmail.com',
      imageProfile: '2.png',
      password: 'phalla1234',
      phoneNumber: '0962987277'),
  User(
      userID: 999734,
      userName: 'KimLong',
      address: 'Phnom Penh',
      email: 'llll@gmail.com',
      imageProfile: '4.png',
      password: 'llll1234',
      phoneNumber: '0964487277'),
  User(
      userID: 5432,
      userName: 'NA NA',
      address: 'Phnom Penh',
      email: 'phaphanna55@gmail.com',
      imageProfile: '3.png',
      password: 'phanna1234',
      phoneNumber: '0962555277'),
  User(
      userID: 1111545,
      userName: 'Vichea',
      address: 'Kompot',
      email: 'vichea55@gmail.com',
      imageProfile: '5.png',
      password: 'vichea1234',
      phoneNumber: '0962553434')
];
