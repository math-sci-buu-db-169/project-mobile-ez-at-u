import 'dart:io';

import '../api/device_info_api.dart';
import '../api/ip_info_api.dart';
import '../api/package_info_api.dart';
import '../widget/info_widget.dart';
import 'package:flutter/material.dart';

import '../api/package_info_api.dart';

class DeviceInfoPage extends StatefulWidget {
  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  Map<String, dynamic> deviceInfo = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final deviceInfo = await DeviceInfoApi.getInfo();

    if (!mounted) return;
    setState(() => this.deviceInfo = deviceInfo);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("MyApp.title"),
          centerTitle: true,
        ),
        body: InfoWidget(map: deviceInfo),
      );
}
