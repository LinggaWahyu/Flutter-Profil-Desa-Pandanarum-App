import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';
import 'package:profil_desa_pandanarum/model/DataStatistik.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchDataStatistik.dart';
import 'package:http/http.dart' as http;

class DataAgamaPage extends StatelessWidget {
 static const String routeName = '/dataAgamaPage';

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
      appBar: AppBar(
        title: Text("Data Agama"),
      ),
      drawer: NavigasiDrawerMenu(),
      body: Center(
        child: FutureBuilder<List<DataStatistik>>(
          future: fetchDataStatistik(http.Client(), 'agama'),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListDataAgama(dataAgama: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ListDataAgama extends StatelessWidget {
  final List<DataStatistik> dataAgama;

  ListDataAgama({Key key, this.dataAgama}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataAgama.length,
      itemBuilder: (context, index) {
        return new GestureDetector(
          onTap: () {},
          child: new Card(
            child: new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          '${dataAgama[index].kelompok}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Text(
                          'Jumlah : ${dataAgama[index].nJumlah}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Presentase Jumlah : ${dataAgama[index].percentJumlah}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Jumlah Laki-Laki : ${dataAgama[index].nMale}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Presentasi Laki-Laki : ${dataAgama[index].percentMale}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Jumlah Perempuan : ${dataAgama[index].nFemale}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Presentasi Perempuan : ${dataAgama[index].percentFemale}',
                          style: Theme.of(context).textTheme.caption,
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