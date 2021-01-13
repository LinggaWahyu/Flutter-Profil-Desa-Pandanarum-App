class DataStatistik {
  final String no;
  final String kelompok;
  final String nJumlah;
  final String percentJumlah;
  final String nMale;
  final String percentMale;
  final String nFemale;
  final String percentFemale;

  DataStatistik({this.no, this.kelompok, this.nJumlah, this.percentJumlah, this.nMale, this.percentMale, this.nFemale, this.percentFemale});

  factory DataStatistik.fromJson(Map<String, dynamic> json) {
    return DataStatistik(
      no: json['no'] as String,
      kelompok: json['kelompok'] as String,
      nJumlah: json['nJumlah'] as String,
      percentJumlah: json['percentJumlah'] as String,
      nMale: json['nMale'] as String,
      percentMale: json['percentMale'] as String,
      nFemale: json['nFemale'] as String,
      percentFemale: json['percentFemale'] as String,
    );
  }
}