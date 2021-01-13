class FormDesa {
  final String description;
  final String link;

  FormDesa({this.description, this.link});

  factory FormDesa.fromJson(Map<String, dynamic> json) {
    return FormDesa(
      description: json['data']['description'] as String,
      link: json['data']['link'] as String,
    );
  }
}