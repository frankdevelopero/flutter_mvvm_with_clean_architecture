class Comic {
  Comic({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailURI,
  });

  late final int id;
  late final String title;
  late final String description;
  late final String thumbnailURI;
}
