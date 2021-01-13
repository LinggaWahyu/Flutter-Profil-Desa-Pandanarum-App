class Organisasi {
  final String img;

  Organisasi({this.img});

  factory Organisasi.fromJson(Map<String, dynamic> json) {
    return Organisasi(
      img: json['data'] as String,
    );
  }
}