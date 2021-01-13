import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/fragments/DetailLayananDesaPage.dart';
import 'package:profil_desa_pandanarum/model/LayananDesa.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchLayananDesa.dart';
import 'package:http/http.dart' as http;

class LayananDesaPage extends StatelessWidget {
  static const String routeName = '/layananDesaPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Layanan Desa"),
      ),
      drawer: NavigasiDrawerMenu(),
      body: Center(
        child: FutureBuilder<List<LayananDesa>>(
          future: fetchLayananDesa(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListLayananDesa(layananDesa: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ListLayananDesa extends StatelessWidget {
  final List<LayananDesa> layananDesa;

  ListLayananDesa({Key key, this.layananDesa}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: layananDesa.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage("${layananDesa[index].img}"),
          ),
          title: Text(layananDesa[index].title),
          subtitle: Text(layananDesa[index].dateTime),
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailLayananDesaItem(
                        id: layananDesa[index].id,
                      )));
          },
        );
      },
    );
  }
}
