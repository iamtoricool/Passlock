class ScreenReqInfo {
  String? title;
  String? heading;
  String? description;
  String imageURL;
  ScreenReqInfo(
      {this.title, this.heading, this.description, required this.imageURL});
}

List<ScreenReqInfo> screenInfo = [
  ScreenReqInfo(
      title: 'Security',
      heading: 'Control your security',
      description:
          'This application is build on blockchain so that you can get 100% security across websites & applications with single app.',
      imageURL: 'assets/icons/shield-tick.png'),
  ScreenReqInfo(
      title: 'Fast',
      heading: 'Everything in single click',
      description:
          'Add, genreate, store, transfer, sync, export & copy all your passwords in single click. Use autofill for quick action without opening app.',
      imageURL: 'assets/icons/box.png'),
  ScreenReqInfo(imageURL: 'assets/icons/Icon.png')
];
