class SearchBook {
  int id;
  String? name;
  String? coverUrl;
  String? bookUrl;
  int? publickDate;
  String? autor;
  int? category;
  String? categoryName;

  SearchBook({
    required this.id,
    required this.name,
    required this.coverUrl,
    required this.bookUrl,
    required this.publickDate,
    required this.autor,
    required this.category,
    required this.categoryName,
  });

  SearchBook.fromJSON(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String?,
        coverUrl = json['coverURL'] as String?,
        bookUrl = json['bookURL'] as String?,
        publickDate = json['publickDate'] as int?,
        autor = json['autor'] as String?,
        category = json['category'] as int?,
        categoryName = json['СategoryName'] as String?;

  @override
  bool operator ==(covariant SearchBook other) {
    return id == other.id &&
        name == other.name &&
        coverUrl == other.coverUrl &&
        publickDate == other.publickDate &&
        autor == other.autor &&
        category == other.category &&
        categoryName == other.categoryName;
  }

  @override
  int get hashCode => super.hashCode * id;
}
