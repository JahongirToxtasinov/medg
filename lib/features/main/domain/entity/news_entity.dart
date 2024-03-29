class NewsEntity {
  final String title;
  final String description;
  final DateTime createdAt;
  final String picture;
  final String category;
  final String doctorName;
  final bool isSaved;
  NewsEntity({
    required this.title,
    required this.description,
    required this.createdAt,
    required this.picture,
    required this.doctorName,
    required this.category,
    required this.isSaved,
  });

  @override
  String toString() {
    return 'NewsEntity{title: $title, description: $description, createdAt: $createdAt, picture: $picture, category: $category, doctorName: $doctorName, isSaved: $isSaved}';
  }
}
