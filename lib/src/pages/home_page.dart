import 'package:flutter/material.dart';
import 'package:qreader/src/pages/direcciones_page.dart';
import 'package:qreader/src/pages/mapas_page.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:qreader/src/providers/db_provider.dart';


class HomePage  extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String _titulo = 'APP QR ';

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(_titulo),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: (){},
          )
        ],
      ),
      body: _callPage( currentIndex ),
      bottomNavigationBar: _crearBottomNavigationBar(), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
      ),   
    );
  }


//http://viplecon.com
//geo:40.71278370000001,-73.95375624140627

  void _scanQR() async {

    String futureString = 'http://viplecon.com';

/*
    try{
      futureString  = await new QRCodeReader().scan();

    }catch(e){
      futureString = e.toString();
    }
    print('futureString : $futureString');

    */
    if( futureString != null ){
      print ('Tenemos informacion');
      final scan = ScanModel( valor: futureString);
      DBProvider.db.nuevoScan(scan);
    }


  }

  Widget _callPage( int paginaActual){
    
    switch( paginaActual ){
      case 0: return MapasPage();
      case 1: return DireccionesPage();

      default :
        return MapasPage();
    }

  }

  Widget _crearBottomNavigationBar(){
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index; 
        });
      },
      items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones')
        )
      ]

    );
  }
}