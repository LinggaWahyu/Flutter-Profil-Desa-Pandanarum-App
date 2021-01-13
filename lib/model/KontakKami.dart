class KontakKami {
  final String description;

  KontakKami({this.description});

  factory KontakKami.fromJson(Map<String, dynamic> json) {
    return KontakKami(
      description: json['data'] as String,
    );
  }
}