class BackpackBook {
  int? id;
  String? name;
  String? autor;
  String? coverUrl;
  String? bookUrl;
  int? category;
  int? userClass;
  int? publickDate;
  int? userID;
  int? bookID;
  int? backpackID;
  String? categoryName;

  BackpackBook({
    this.id,
    this.name,
    this.autor,
    this.coverUrl,
    this.bookUrl,
    this.category,
    this.userClass,
    this.publickDate,
    this.userID,
    this.bookID,
    this.backpackID,
    this.categoryName,
  });

  BackpackBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    autor = json['autor'];
    coverUrl = json['coverURL'];
    bookUrl = json['bookURL'];
    category = json['category'];
    userClass = json['class'];
    publickDate = json['publickDate'];
    userID = json['userID'];
    bookID = json['bookID'];
    backpackID = json['backpackID'];
    categoryName = json['СategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['autor'] = autor;
    data['coverURL'] = coverUrl;
    data['bookURL'] = bookUrl;
    data['category'] = category;
    data['class'] = userClass;
    data['publickDate'] = this.publickDate;
    data['userID'] = userID;
    data['bookID'] = bookID;
    data['backpackID'] = backpackID;
    data['СategoryName'] = categoryName;
    return data;
  }

  @override
  bool operator ==(covariant BackpackBook book) {
    return id == book.id &&
        name == book.name &&
        autor == book.autor &&
        coverUrl == book.coverUrl &&
        bookUrl == book.bookID &&
        category == book.category &&
        userClass == book.userClass &&
        publickDate == book.publickDate &&
        userID == book.userID &&
        bookID == book.bookID &&
        backpackID == book.backpackID &&
        categoryName == book.categoryName;
  }
}
