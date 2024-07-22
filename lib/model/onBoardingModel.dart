class OnBoardingContent {
  String image;
  String title;
  String description;

  OnBoardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoardingContent> onBoardingContents = [
  OnBoardingContent(
    image: 'images/Slide1.jpg',
    title: 'Welcome to Pro-ledge',
    description:
        'Discover a world of knowledge and adventure with Pro-Ledge! Get ready to embark on a journey filled with books.',
  ),
  OnBoardingContent(
    image: 'images/Slide2.jpg',
    title: 'Providing new knowledge',
    description:
        'Pro-Ledge also has many books with different genres, and always provides information about the latest books.',
  ),
  OnBoardingContent(
    image: 'images/Slide3.jpg',
    title: 'Let\'s start reading',
    description:
        'So, what are you waiting for? Let\'s get started with Pro-Ledge, you\'ll have access to a world of stories and information right at your fingertips!',
  ),
];