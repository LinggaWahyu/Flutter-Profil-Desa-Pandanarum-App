import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';
import 'package:profil_desa_pandanarum/model/DataStatistik.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchDataStatistik.dart';
import 'package:http/http.dart' as http;

class DataPekerjaanPage extends StatelessWidget {
 static const String routeName = '/dataPekerjaanPage';

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
      appBar: AppBar(
        title: Text("Data Pekerjaan"),
      ),
      drawer: NavigasiDrawerMenu(),
      body: Center(
        child: FutureBuilder<List<DataStatistik>>(
          future: fetchDataStatistik(http.Client(), 'pekerjaan'),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListDataPekerjaan(dataPekerjaan: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ListDataPekerjaan extends StatelessWidget {
  final List<DataStatistik> dataPekerjaan;

  ListDataPekerjaan({Key key, this.dataPekerjaan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataPekerjaan.length,
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
                          '${dataPekerjaan[index].kelompok}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Text(
                          'Jumlah : ${dataPekerjaan[index].nJumlah}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Presentase Jumlah : ${dataPekerjaan[index].percentJumlah}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Jumlah Laki-Laki : ${dataPekerjaan[index].nMale}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Presentasi Laki-Laki : ${dataPekerjaan[index].percentMale}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Jumlah Perempuan : ${dataPekerjaan[index].nFemale}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Presentasi Perempuan : ${dataPekerjaan[index].percentFemale}',
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