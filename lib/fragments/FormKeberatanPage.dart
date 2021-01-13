import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';
import 'package:profil_desa_pandanarum/model/FormDesa.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchForm.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      home: FormKeberatanPage(),
      debugShowCheckedModeBanner: false,
    ));

class FormKeberatanPage extends StatelessWidget {
  static const String routeName = '/formKeberatanPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Download Form Keberatan'),
      ),
      drawer: NavigasiDrawerMenu(),
      body: Center(
        child: FutureBuilder<FormDesa>(
          future: fetchForm(http.Client(), 'keberatan'),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? FormKeberatan(formKeberatan: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class FormKeberatan extends StatefulWidget {
  final FormDesa formKeberatan;

  FormKeberatan({Key key, @required this.formKeberatan}) : super(key: key);

  FormKeberatanPageState createState() {
    return new FormKeberatanPageState(formKeberatan);
  }
}

class FormKeberatanPageState extends State<FormKeberatan> {
  FormDesa formKeberatan;
  FormKeberatanPageState(this.formKeberatan);

  bool downloading = false;
  var progressString = "";

  @override
  void initState() {
    super.initState();

    getPermission();

    downloadFile();
  }

  void getPermission() async {
    print("getPermission");
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_DOWNLOADS);

      await dio.download("${formKeberatan.link}", "$dir/Form Keberatan.pdf",
          onReceiveProgress: (rec, total) {
        print("Rec: $rec, Total: $total");

        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });

    print("Download Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: downloading
            ? Container(
                height: 120.0,
                width: 200.0,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Downloading File : $progressString',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Form Berhasil di Download'),
                  Text('Silahkan Cek Folder Download Anda'),
                  Text('\n'),
                  Text('Nama File : '),
                  Text('Form Keberatan.pdf', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
      ),
    );
  }
}
