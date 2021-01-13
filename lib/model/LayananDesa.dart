class LayananDesa {
  final String id;
  final String title;
  final String dateTime;
  final String img;
  final String link;

  LayananDesa({this.id, this.title, this.dateTime, this.img, this.link});

  factory LayananDesa.fromJson(Map<String, dynamic> json) {
    return LayananDesa(
      id: json['id'] as String,
      title: json['title'] as String,
      dateTime: json['dateTime'] as String,
      img: json['img'] as String,
      link: json['link'] as String,
    );
  }
}