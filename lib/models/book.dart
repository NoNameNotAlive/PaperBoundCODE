class Book {
  final int idLlibre;
  final String title;
  final String author;
  final String imgUrl;
  final String synopsis;
  final int sale;
  final double price;

  Book({
    required this.idLlibre,
    required this.title,
    required this.author,
    required this.imgUrl,
    required this.synopsis,
    required this.sale,
    required this.price,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      idLlibre: json['idLlibre'],
      title: json['titol'],
      author: json['nomAutor'],
      imgUrl: json['urlImatge'],
      synopsis: json['sinopsi'],
      sale: json['descompte'],
      price: json['preuTotal'],
    );
  }
}

class Books {
  List<Book> books = [];

  Books();

  Books.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final book = new Book.fromJson(item);
      books.add(book);
    }
  }
}
