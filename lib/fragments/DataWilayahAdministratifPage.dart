import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';
import 'package:profil_desa_pandanarum/model/DataAdministratif.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchDataAdministratif.dart';
import 'package:http/http.dart' as http;

class DataWilayahAdministratifPage extends StatelessWidget {
 static const String routeName = '/dataWilayahAdministratifPage';

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
      appBar: AppBar(
        title: Text("Data Wilayah Administratif Desa"),
      ),
      drawer: NavigasiDrawerMenu(),
      body: Center(
        child: FutureBuilder<List<DataAdministratif>>(
          future: fetchDataAdministratif(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListDataAdministratif(dataAdministratif: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ListDataAdministratif extends StatelessWidget {
  final List<DataAdministratif> dataAdministratif;

  ListDataAdministratif({Key key, this.dataAdministratif}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataAdministratif.length,
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
                          '${dataAdministratif[index].namaDusun}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Text(
                          'Jumlah RT : ${dataAdministratif[index].jumlahRT}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Jumlah KK : ${dataAdministratif[index].jumlahKK}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Jumlah Jiwa : ${dataAdministratif[index].jiwa}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Jumlah Laki-Laki : ${dataAdministratif[index].jumlahLaki}',
                          style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                          'Jumlah Perempuan : ${dataAdministratif[index].jumlahPerempuan}',
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