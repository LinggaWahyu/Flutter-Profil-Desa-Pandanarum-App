import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/routes/PageRoute.dart';

class NavigasiDrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _headerDrawer(),
          _itemDrawer(icon: Icons.home, menu: 'Artikel', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.artikel)),
          _itemDrawer(icon: Icons.view_list, menu: 'Layanan Desa', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.layananDesa)),
          _itemDrawer(icon: Icons.photo, menu: 'Galeri Desa', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.galeriDesa)),
          _itemDrawerDisable(Icons.dashboard, 'Profil Desa'),
          _subItemDrawer(icon: Icons.details, menu: 'Profile', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.profilDesa)),
          _subItemDrawer(icon: Icons.people_outline, menu: 'Struktur Organisasi', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.strukturOrganisasi)),
          _subItemDrawer(icon: Icons.group, menu: 'Pengurus Kartar', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.pengurusKartar)),
          _subItemDrawer(icon: Icons.group_add, menu: 'Badan Pemusyawarah', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.badanPemusyawarah)),
          _subItemDrawer(icon: Icons.group_work, menu: 'Pengurus BUMDES', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.pengurusBUMDES)),
          _subItemDrawer(icon: Icons.airplay, menu: 'Visi dan Misi', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.visiMisi)),
          _itemDrawerDisable(Icons.search, 'Data Desa'),
          _subItemDrawer(icon: Icons.work, menu: 'Data Pekerjaan', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.dataPekerjaan)),
          _subItemDrawer(icon: Icons.place, menu: 'Data Wilayah Administratif', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.dataWilayahAdministratif)),
          _subItemDrawer(icon: Icons.school, menu: 'Data Pendidikan dalam KK', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.dataPendidikan)),
          _subItemDrawer(icon: Icons.dvr, menu: 'Data Agama', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.dataAgama)),
          _itemDrawer(icon: Icons.contacts, menu: 'Kontak Kami', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.kontakKami)),
          _itemDrawerDisable(Icons.file_download, 'Download Formulir'),
          _subItemDrawer(icon: Icons.file_download, menu: 'Form Keberatan', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.formKeberatan)),
          _subItemDrawer(icon: Icons.file_download, menu: 'Form Pemberitahuan Tertulis', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.formPemberitahuanTertulis)),
          _subItemDrawer(icon: Icons.file_download, menu: 'Form Penolakan Informasi', onTap: () => Navigator.pushReplacementNamed(context, PageRoutes.formPenolakanInformasi)),
        ],
      ),
    );
  }
}

Widget _headerDrawer() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: Container(
      child: Image(
        image: NetworkImage(
            'https://openstreetmap.id/apik-jatim/media/uploads/94_1_1567170925.jpg'),
      ),
    ),
    accountName: Text('Desa Pandanarum'),
    accountEmail: Text('Kec. Sutojayan Kab. Blitar'),
  );
}

Widget _itemDrawer({IconData icon, String menu, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            menu, style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}

Widget _itemDrawerDisable(IconData icon, String menu) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            menu, style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}

Widget _subItemDrawer({IconData icon, String menu, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 45.0),
          child: Icon(icon),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            menu, style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
