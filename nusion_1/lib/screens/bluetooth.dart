import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothDevices extends StatefulWidget {
  @override
  _BluetoothDevicesState createState() => _BluetoothDevicesState();
}

class _BluetoothDevicesState extends State<BluetoothDevices> {
  late FlutterReactiveBle flutterReactiveBle;
  List<DiscoveredDevice> devices = [];

  @override
  void initState() {
    super.initState();
    flutterReactiveBle = FlutterReactiveBle();
  }

  void startScan() async {
    PermissionStatus locationStatus = await Permission.location.status;
    PermissionStatus bluetoothStatus = await Permission.bluetooth.status;
    PermissionStatus bluetoothScanStatus = await Permission.bluetoothScan.status;
    PermissionStatus bluetoothAdvertiseStatus = await Permission.bluetoothAdvertise.status;
    PermissionStatus bluetoothConnectStatus = await Permission.bluetoothConnect.status;

    if (!locationStatus.isGranted) {
      PermissionStatus result = await Permission.location.request();
      if (!result.isGranted) {
        // El usuario no concedió el permiso
        print('El usuario no concedió el permiso de ubicación');
        return;
      }
    }

    if (!bluetoothScanStatus.isGranted) {
      PermissionStatus result = await Permission.bluetoothScan.request();
      if (!result.isGranted) {
        // El usuario no concedió el permiso de Bluetooth
        print('El usuario no concedió el permiso de Bluetooth Scan');
        return;
      }
    }

    

    if (!bluetoothStatus.isGranted) {
      PermissionStatus result = await Permission.bluetooth.request();
      if (!result.isGranted) {
        // El usuario no concedió el permiso de Bluetooth
        print('El usuario no concedió el permiso de Bluetooth');
        return;
      }
    }

    /*

    if (!bluetoothAdvertiseStatus.isGranted) {
      PermissionStatus result = await Permission.bluetoothAdvertise.request();
      if (!result.isGranted) {
        // El usuario no concedió el permiso de Bluetooth
        print('El usuario no concedió el permiso de Bluetooth Advertise');
        return;
      }
    }

    if (!bluetoothConnectStatus.isGranted) {
      PermissionStatus result = await Permission.bluetoothConnect.request();
      if (!result.isGranted) {
        // El usuario no concedió el permiso de Bluetooth
        print('El usuario no concedió el permiso de Bluetooth Connect');
        return;
      }
    }

    */

    try {
      await for (var device in flutterReactiveBle.scanForDevices(
        withServices: [],
        scanMode: ScanMode.lowLatency,
        requireLocationServicesEnabled: true,
      )) {
        setState(() {
          devices.add(device);
        });
      }
    } catch (e) {
      print('Error al escanear dispositivos: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: Text('Bluetooth Devices'),
      ),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(devices[index].name),
            subtitle: Text(devices[index].id.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startScan,
        child: Icon(Icons.search),
      ),
    );
  }
}