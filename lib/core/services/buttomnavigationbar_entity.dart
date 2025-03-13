class ButtomnavigationbarEntity {
  final String activeImage;
  final String unActiveImage;
  final String name;

  ButtomnavigationbarEntity({
    required this.activeImage,
    required this.unActiveImage,
    required this.name,
  });
}

List<ButtomnavigationbarEntity> getbuttomnavigationbarList = [
  ButtomnavigationbarEntity(
    activeImage: "assets/icons/bold/home.svg",
    unActiveImage: "assets/icons/outline/home.svg",
    name: "Home",
  ),
  ButtomnavigationbarEntity(
    activeImage: "assets/icons/bold/scanner.svg",
    unActiveImage: "assets/icons/outline/scan.svg",
    name: "Scan",
  ),
  ButtomnavigationbarEntity(
    activeImage: "assets/icons/bold/user.svg",
    unActiveImage: "assets/icons/outline/user.svg",
    name: "Profile",
  ),
];
