class Genre {
  final String name;
  final String img;

  Genre({required this.name, required this.img});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(name: json['nomGenere'], img: json['imgGenere']);
  }
}

class Genres {
  List<Genre> genres = [];

  Genres();

  Genres.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final genre = new Genre.fromJson(item);
      genres.add(genre);
    }
  }
}
