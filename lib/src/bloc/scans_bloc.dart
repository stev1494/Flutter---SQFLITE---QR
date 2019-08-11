

import 'dart:async';

import 'package:qreader/src/providers/db_provider.dart';

class ScansBloc {
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc(){
    return _singleton;

  }

  ScansBloc._internal(){
    //Obtener Scans de la DB
    obtenerScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream <List<ScanModel>> get scansStream => _scansController.stream;

  dispose(){
    _scansController?.close();
  }


  //Obtener toda la informacion de los scans
  obtenerScans() async {
    _scansController.sink.add(await DBProvider.db.getTodosScans());
  }

  agregarScan( ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  borrarScans( int id)  async {
   await DBProvider.db.deleteScan(id);
  }

  borrarScanTodos() async {
    await DBProvider.db.deleteAll();
    obtenerScans();
  }
  
}