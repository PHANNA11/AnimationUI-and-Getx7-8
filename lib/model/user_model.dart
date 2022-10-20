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
      imageProfile:
          'https://scontent.fpnh24-1.fna.fbcdn.net/v/t1.6435-9/93914700_757236491472575_8750624973699153920_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeEPm_lZQi0H913oeziPHo8-lK1CDd3tP2qUrUIN3e0_agb6Qui26QCHpncz9Z6QZhjGYPM3sr3P2d6toVaeWQXZ&_nc_ohc=coQEjr1sTS8AX9P1PxA&_nc_ht=scontent.fpnh24-1.fna&oh=00_AT8aNmW8xaV-I3l4trc5BGkBSsz-NlUccKun9jLXF0v3LQ&oe=6374E8DB',
      password: 'phanna1234',
      phoneNumber: '0962987277'),
  User(
      userID: 2234545,
      userName: 'Phalla',
      address: 'Kompong Chhnang',
      email: 'ABCD@gmail.com',
      imageProfile:
          'https://scontent.fpnh24-1.fna.fbcdn.net/v/t1.6435-9/93914700_757236491472575_8750624973699153920_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeEPm_lZQi0H913oeziPHo8-lK1CDd3tP2qUrUIN3e0_agb6Qui26QCHpncz9Z6QZhjGYPM3sr3P2d6toVaeWQXZ&_nc_ohc=coQEjr1sTS8AX9P1PxA&_nc_ht=scontent.fpnh24-1.fna&oh=00_AT8aNmW8xaV-I3l4trc5BGkBSsz-NlUccKun9jLXF0v3LQ&oe=6374E8DB',
      password: 'phalla1234',
      phoneNumber: '0962987277'),
  User(
      userID: 999734,
      userName: 'KimLong',
      address: 'Phnom Penh',
      email: 'llll@gmail.com',
      imageProfile: '',
      password: 'llll1234',
      phoneNumber: '0964487277'),
  User(
      userID: 5432,
      userName: 'NA NA',
      address: 'Phnom Penh',
      email: 'phaphanna55@gmail.com',
      imageProfile: '',
      password: 'phanna1234',
      phoneNumber: '0962555277'),
  User(
      userID: 1111545,
      userName: 'Vichea',
      address: 'Kompot',
      email: 'vichea55@gmail.com',
      imageProfile: '',
      password: 'vichea1234',
      phoneNumber: '0962553434')
];
