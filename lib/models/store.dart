class Store {
  final String name;
  final String latitude;
  final String length;
  Store({
    required this.name,
    required this.latitude,
    required this.length,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      name: json['nombre'],
      latitude: json['latitud'],
      length: json['longitud'],
    );
  }
}

class Stores {
  List<Store> stores = [];

  Stores();

  Stores.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final book = new Store.fromJson(item);
      stores.add(book);
    }
  }
}
