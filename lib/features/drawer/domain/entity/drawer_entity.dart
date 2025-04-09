class DrawerEntity {
  final String title;
  final String image;

  DrawerEntity({required this.title, required this.image});
  static List<DrawerEntity> drawerItemList = [
    DrawerEntity(title: "Profile", image: "assets/icons/bold/user.svg"),
    DrawerEntity(title: "Categories", image: "assets/icons/bold/category.svg"),
    DrawerEntity(title: "History", image: "assets/icons/bold/history.svg"),
  ];
}
