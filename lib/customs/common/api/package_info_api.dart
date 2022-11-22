import 'dart:io';

import 'package:package_info/package_info.dart';

class PackageInfoApi {
  static Future<String> getPackageName() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.packageName;
  }

  static Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return '${packageInfo.version} +${packageInfo.buildNumber}';
  }

  static Future<Map<String, dynamic>> getInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final idName = Platform.isAndroid ? 'packageName' : 'bundleID';
    print("packageInfo");
    print("appName: ${packageInfo.appName}\n"
        "idName: ${packageInfo.packageName},\n"
        "version: ${packageInfo.version},\n"
        "buildNumber: ${packageInfo.buildNumber},\n");
    print("packageInfo");
    return <String, dynamic>{
      'appName': packageInfo.appName,
      idName: packageInfo.packageName,
      'version': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
    };
  }
}
