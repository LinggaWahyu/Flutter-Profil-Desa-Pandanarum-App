class SubGaleriDesa {
  final String title;
  final String img;

  SubGaleriDesa({this.title, this.img});

  factory SubGaleriDesa.fromJson(Map<String, dynamic> json) {
    return SubGaleriDesa(
      title: json['title'] as String,
      img: json['img'] as String,
    );
  }
}