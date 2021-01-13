import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';
import 'package:profil_desa_pandanarum/model/DataStatistik.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchDataStatistik.dart';
import 'package:http/http.dart' as http;

class DataPendidikanPage extends StatelessWidget {
 static const String routeName = '/dataPendidikanPage';

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
      appBar: AppBar(
        title: Text("Data Pendidikan"),
      ),
      drawer: NavigasiDrawerMenu(),
      body: Center(
        child: FutureBuilder<List<DataStatistik>>(
          future: fetchDataStatistik(http.Client(), 'pendidikan'),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListDataPendidikan(dataPendidikan: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ListDataPendidikan extends StatelessWidget {
  final List<DataStatistik> dataPendidikan;

  ListDataPendidikan({Key key, this.dataPendidikan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataPendidikan.length,
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
                          '${dataPendidikan[index].kelompok}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Text(
                          'Jumlah : ${dataPendidikan[index].nJumlah}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Presentase Jumlah : ${dataPendidikan[index].percentJumlah}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Jumlah Laki-Laki : ${dataPendidikan[index].nMale}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Presentasi Laki-Laki : ${dataPendidikan[index].percentMale}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Jumlah Perempuan : ${dataPendidikan[index].nFemale}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Presentasi Perempuan : ${dataPendidikan[index].percentFemale}',
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