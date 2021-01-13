import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:profil_desa_pandanarum/model/SubGaleriDesa.dart';
import 'package:profil_desa_pandanarum/videmodel/fetchSubGaleriDesa.dart';
import 'package:http/http.dart' as http;

class SubGaleriDesaItem extends StatelessWidget {
  final String id;

  SubGaleriDesaItem({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<SubGaleriDesa>>(
        future: fetchSubGaleriDesa(http.Client(), id),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? SubGaleriDesaPage(subGaleri: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class SubGaleriDesaPage extends StatelessWidget {
  final List<SubGaleriDesa> subGaleri;

  SubGaleriDesaPage({Key key, @required this.subGaleri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeri Photo Desa'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "${subGaleri[0].title}",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: subGaleri.length,
                    itemBuilder: (context, index) {
                      return RawMaterialButton(
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage("${subGaleri[index].img}"),
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
