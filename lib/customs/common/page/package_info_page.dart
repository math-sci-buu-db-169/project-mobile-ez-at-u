import 'dart:io';

import '../api/device_info_api.dart';
import '../api/ip_info_api.dart';
import '../api/package_info_api.dart';
import '../widget/info_widget.dart';
import 'package:flutter/material.dart';

import '../api/package_info_api.dart';

class PackageInfoPage extends StatefulWidget {
  @override
  _PackageInfoPageState createState() => _PackageInfoPageState();
}

class _PackageInfoPageState extends State<PackageInfoPage> {
  Map<String, dynamic> packageInfo = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final packageInfo = await PackageInfoApi.getInfo();
    final ipAddress = await IpInfoApi.getIPAddress();

    final newPackageInfo = {
      'ipAddress': ipAddress,
      ...packageInfo,
    };

    if (!mounted) return;

    setState(() => this.packageInfo = newPackageInfo);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("MyApp.title"),
          centerTitle: true,
        ),
        body: InfoWidget(map: packageInfo),
      );
}
