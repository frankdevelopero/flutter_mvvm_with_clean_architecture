class ImageItem {
  ImageItem({
    required this.id,
    required this.imageURI,
    required this.title,
  });

  final int id;
  final String imageURI;
  final String title;

  static ImageItem buttonSeeMore = ImageItem(id: -1, imageURI: "{see-more}", title: "Not found");
}
