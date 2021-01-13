import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/fragments/ArtikelPage.dart';
import 'package:profil_desa_pandanarum/fragments/BadanPemusyawarahPage.dart';
import 'package:profil_desa_pandanarum/fragments/DataAgamaPage.dart';
import 'package:profil_desa_pandanarum/fragments/DataDesaPage.dart';
import 'package:profil_desa_pandanarum/fragments/DataPekerjaanPage.dart';
import 'package:profil_desa_pandanarum/fragments/DataPendidikanPage.dart';
import 'package:profil_desa_pandanarum/fragments/DataWilayahAdministratifPage.dart';
import 'package:profil_desa_pandanarum/fragments/FormKeberatanPage.dart';
import 'package:profil_desa_pandanarum/fragments/FormPemberitahuanTertulisPage.dart';
import 'package:profil_desa_pandanarum/fragments/FormPenolakanInformasiPage.dart';
import 'package:profil_desa_pandanarum/fragments/GaleriDesaPage.dart';
import 'package:profil_desa_pandanarum/fragments/KontakKamiPage.dart';
import 'package:profil_desa_pandanarum/fragments/LayananDesaPage.dart';
import 'package:profil_desa_pandanarum/fragments/PengurusBUMDESPage.dart';
import 'package:profil_desa_pandanarum/fragments/PengurusKartarPage.dart';
import 'package:profil_desa_pandanarum/fragments/ProfilDesaPage.dart';
import 'package:profil_desa_pandanarum/fragments/StrukturOrganisasiPage.dart';
import 'package:profil_desa_pandanarum/fragments/VisiMisiPage.dart';
import 'package:profil_desa_pandanarum/routes/PageRoute.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Menu Drawer',
      home: ProfilDesaPage(),
      routes: {
        PageRoutes.artikel: (context) => ArtikelPage(),
        PageRoutes.dataDesa: (context) => DataDesaPage(),
        PageRoutes.formKeberatan: (context) => FormKeberatanPage(),
        PageRoutes.formPemberitahuanTertulis: (context) => FormPemberitahuanTertulisPage(),
        PageRoutes.formPenolakanInformasi: (context) => FormPenolakanInformasiPage(),
        PageRoutes.galeriDesa: (context) => GaleriDesaPage(),
        PageRoutes.kontakKami: (context) => KontakKamiPage(),
        PageRoutes.layananDesa: (context) => LayananDesaPage(),
        PageRoutes.profilDesa: (context) => ProfilDesaPage(),
        PageRoutes.strukturOrganisasi: (context) => StrukturOrganisasiPage(),
        PageRoutes.pengurusKartar: (context) => PengurusKartarPage(),
        PageRoutes.badanPemusyawarah: (context) => BadanPemusyawarahPage(),
        PageRoutes.pengurusBUMDES: (context) => PengurusBUMDESPage(),
        PageRoutes.visiMisi: (context) => VisiMisiPage(),
        PageRoutes.dataPekerjaan: (context) => DataPekerjaanPage(),
        PageRoutes.dataWilayahAdministratif: (context) => DataWilayahAdministratifPage(),
        PageRoutes.dataPendidikan: (context) => DataPendidikanPage(),
        PageRoutes.dataAgama: (context) => DataAgamaPage(),
      },
    );
  }
}