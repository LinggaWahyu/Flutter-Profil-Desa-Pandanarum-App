import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/fragments/DetailArtikelPage.dart';
import 'package:profil_desa_pandanarum/model/Artikel.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchArtikel.dart';
import 'package:http/http.dart' as http;

class ArtikelPage extends StatelessWidget {
  static const String routeName = '/artikelPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Artikel"),
      ),
      drawer: NavigasiDrawerMenu(),
      body: Center(
        child: FutureBuilder<List<Artikel>>(
          future: fetchArtikel(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListArtikel(artikel: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ListArtikel extends StatelessWidget {
  final List<Artikel> artikel;

  ListArtikel({Key key, this.artikel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: artikel.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage("${artikel[index].img}"),
          ),
          title: Text(artikel[index].title),
          subtitle: Text(artikel[index].dateTime),
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailArtikelItem(
                        id: artikel[index].id,
                      )));
          },
        );
      },
    );
  }
}
