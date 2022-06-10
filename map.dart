import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-5.088544046019581, -42.81123803149089);

  Set<Marker> _marcadores = {};
  _carregarMarcadores() {
    Set<Marker> marcadoresLocal = {};
    Marker marcadoIfpi = Marker(
      markerId: MarkerId('IFPI'),
      position: LatLng(-5.088544046019581, -42.81123803149089),
    );
    Marker marcadoAtacadao = Marker(
      markerId: MarkerId('Atacadao'),
      position: LatLng(-5.0684959, -42.8130301),
    );
    Marker marcadoIfpiSul = Marker(
      markerId: MarkerId('IFPISUl'),
      position: LatLng(-5.101723, -42.813114),
    );
    Marker marcadolocal = Marker(
      markerId: MarkerId('lol'),
      position: LatLng(-5.069244, -42.820154),
    );
    Marker marcadolonge = Marker(
      markerId: MarkerId('longe'),
      position: LatLng(-5.0673123,-42.7198316),
    );
    marcadoresLocal.add(marcadoIfpiSul);
    marcadoresLocal.add(marcadoIfpi);
    marcadoresLocal.add(marcadolocal);
    marcadoresLocal.add(marcadoAtacadao);
    marcadoresLocal.add(marcadolonge);
    setState(() {
      _marcadores = marcadoresLocal;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _carregarMarcadores();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 12.0,
          ),
          markers: _marcadores,
        ),
      ),
    );
  }
}
