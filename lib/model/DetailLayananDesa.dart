class DetailLayananDesa {
  final String title;
  final String dateTime;
  final String img;
  final String description;

  DetailLayananDesa({this.title, this.dateTime, this.img, this.description});

  factory DetailLayananDesa.fromJson(Map<String, dynamic> json) {
    return DetailLayananDesa(
      title: json['data']['title'] as String,
      dateTime: json['data']['dateTime'] as String,
      img: json['data']['img'] as String,
      description: json['data']['description'] as String,
    );
  }
}