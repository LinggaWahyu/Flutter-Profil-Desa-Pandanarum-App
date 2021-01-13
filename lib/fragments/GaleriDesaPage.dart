import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/fragments/SubGaleriDesaPage.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';
import 'package:profil_desa_pandanarum/model/GaleriDesa.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchGaleriDesa.dart';
import 'package:http/http.dart' as http;

class GaleriDesaPage extends StatelessWidget {
  static const String routeName = '/galeriDesaPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Galeri Desa"),
      ),
      drawer: NavigasiDrawerMenu(),
      body: Center(
        child: FutureBuilder<List<GaleriDesa>>(
          future: fetchGaleriDesa(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListGaleriDesa(galeriDesa: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ListGaleriDesa extends StatelessWidget {
  final List<GaleriDesa> galeriDesa;

  ListGaleriDesa({Key key, this.galeriDesa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: galeriDesa.length,
      itemBuilder: (context, index) {
        return new GestureDetector(
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubGaleriDesaItem(
                              id: galeriDesa[index].id,
                            )));
          },
          child: new Card(
            child: new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    "${galeriDesa[index].thumbnail}",
                    width: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '${galeriDesa[index].albumTitle}',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
