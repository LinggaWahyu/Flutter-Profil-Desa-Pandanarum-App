class ProfilDesa {
  final String description;

  ProfilDesa({this.description});

  factory ProfilDesa.fromJson(Map<String, dynamic> json) {
    return ProfilDesa(
      description: json['data'] as String,
    );
  }
}