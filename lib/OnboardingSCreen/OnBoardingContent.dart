class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Collaborative Approach",
    image: "assets/images/10d05a07e7a2d93351a1e18a6b65e756.jpg",
    desc: "The community watch feature allows you to contribute to the safety of others",
  ),
  OnboardingContents(
    title: "Emergency Services",
    image: "assets/images/police4.png",
    desc:
    "Reach out for assistance, provide crucial information, and receive immediate guidance",
  ),
  OnboardingContents(
    title: "Get notified when community engage",
    image: "assets/images/alert.png",
    desc:
    "Reach out for assistance, provide crucial information, and receive immediate guidance",
  ),
];