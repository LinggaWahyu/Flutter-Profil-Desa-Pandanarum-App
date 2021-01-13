class DataAdministratif {
  final String no;
  final String namaDusun;
  final String kepalaDusun;
  final String jumlahRT;
  final String jumlahKK;
  final String jiwa;
  final String jumlahLaki;
  final String jumlahPerempuan;

  DataAdministratif({this.no, this.namaDusun, this.kepalaDusun, this.jumlahRT, this.jumlahKK, this.jiwa, this.jumlahLaki, this.jumlahPerempuan});

  factory DataAdministratif.fromJson(Map<String, dynamic> json) {
    return DataAdministratif(
      no: json['no'] as String,
      namaDusun: json['namaDusun'] as String,
      kepalaDusun: json['kepalaDusun'] as String,
      jumlahRT: json['jumlahRT'] as String,
      jumlahKK: json['jumlahKK'] as String,
      jiwa: json['jiwa'] as String,
      jumlahLaki: json['jumlahLaki'] as String,
      jumlahPerempuan: json['jumlahPerempuan'] as String,
    );
  }
}