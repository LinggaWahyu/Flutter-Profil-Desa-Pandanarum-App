import 'package:flutter/material.dart';
import 'package:profil_desa_pandanarum/navigationDrawer/NavigasiDrawerMenu.dart';

class DataDesaPage extends StatelessWidget {
 static const String routeName = '/dataDesaPage';

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
       appBar: AppBar(
         title: Text("Data Desa"),
       ),
       drawer: NavigasiDrawerMenu(),
              body: Center(child: Text("This is data desa page")));
 }
}