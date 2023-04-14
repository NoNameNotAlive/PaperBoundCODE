class QRPage {
  final String login;

  QRPage({
    required this.login,
  });

  factory QRPage.fromJson(Map<String, dynamic> json) {
    return QRPage(
      login: json['login'],
    );
  }
}

class Books {
  List<QRPage> qrpages = [];

  Books();

  Books.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final book = new QRPage.fromJson(item);
      qrpages.add(book);
    }
  }
}
