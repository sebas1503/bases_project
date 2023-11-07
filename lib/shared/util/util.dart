import 'dart:io';
import 'package:archive/archive.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

// import 'package:software2/shared/util/const.dart';
import 'package:package_info/package_info.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class Util {
  static final device = _Device._();
  static final data = _Data._();
}

class _Data {
  _Data._();

  // String getErrorMessage(dynamic response) {
  //   String error = '';
  //   if (response.runtimeType.toString() == "InvalidUserError") {
  //     error = (response).failedValue;
  //   } else if (response.runtimeType.toString() == "InvalidPasswordError") {
  //     error = (response).failedValue;
  //   } else if (response.runtimeType.toString() == "NetworkException") {
  //     error = (response).toString();
  //   } else if (response.runtimeType.toString() == "TimeoutException") {
  //     error = (response).toString();
  //   } else if (response.runtimeType.toString() == "_ClientSocketException") {
  //     error = (response).toString();
  //   } else {
  //     error = (response).toString();
  //   }

  //   return error;
  // }

  // String getFormatCurrency(dynamic value) {
  //   final oCcy = NumberFormat("#,##0", "es_CO");
  //   return '\$${oCcy.format(value)}';
  // }

  // String getUrl(int type) {
  //   Const constants = Const();

  //   var buffer = StringBuffer();
  //   buffer.write("http");
  //   buffer.write(constants.cert ? "s" : "");
  //   buffer.write(":");
  //   buffer.write("//");

  //   switch (type) {
  //     case Const.typeService:
  //       buffer.write(constants.baseService);
  //       break;
  //     case Const.typeSync:
  //       buffer.write(constants.baseSync);
  //       break;
  //     case Const.typePayWompi:
  //       buffer.write(constants.baseWompi);
  //       break;
  //   }

  //   buffer.write(constants.port.isEmpty ? "" : ":");
  //   buffer.write(constants.port);
  //   buffer.write("/");

  //   switch (type) {
  //     case Const.typeService:
  //       buffer.write(constants.pathService);
  //       break;
  //     case Const.typeSync:
  //       buffer.write(constants.pathSync);
  //       break;
  //     case Const.typePayWompi:
  //       buffer.write(constants.pathWompi);
  //       break;
  //   }

  //   buffer.write("/");

  //   return buffer.toString();
  // }
}

class _Device {
  _Device._();

  // void launchWhatsapp(context, {required String whatsAppNumber}) async {
  //   var whatsapp = '+57$whatsAppNumber';
  //   var whatsappURLAndroid =
  //       "whatsapp://send?phone=$whatsapp&text=Hola, necesito ayuda con la app supervisores";
  //   var whatsappURLiOS =
  //       "https://wa.me/$whatsapp?text=${Uri.parse("Hola, necesito ayuda con la app supervisores")}";
  //   if (Platform.isIOS) {
  //     try {
  //       await launchUrl(Uri.parse(whatsappURLiOS),
  //           mode: LaunchMode.externalApplication);
  //     } catch (e) {
  //       CustomAlert(
  //           title: "¡Alerta!",
  //           image: 'assets/error_trs.png',
  //           body: "No tienes WhatsApp instalado",
  //           barrierDismissible: false,
  //           onPressed: () async {
  //             Get.back();
  //             await launchUrlString(
  //                 'https://apps.apple.com/co/app/whatsapp-messenger/id$whatsAppNumber');
  //           });
  //     }
  //   } else {
  //     try {
  //       await launchUrl(Uri.parse(whatsappURLAndroid));
  //     } catch (e) {
  //       CustomAlert(
  //           title: "¡Alerta!",
  //           body: "No tienes WhatsApp instalado",
  //           barrierDismissible: false,
  //           onPressed: () async {
  //             Get.back();
  //             await launchUrlString(
  //                 'https://play.google.com/store/apps/details?id=com.whatsapp');
  //           });
  //     }
  //   }
  //   return;
  // }

  // void launchUrls({required String url}) {
  //   final Uri uri = Uri.parse(url);
  //   launchUrl(uri, mode: LaunchMode.externalApplication);
  // }

  // fatalError(error, stackTrace, String reason) =>
  //     Crashlytics().fatalError(error, stackTrace, reason);

  // nonFatalError(error, stackTrace, String reason) =>
  //     Crashlytics().nonFatalError(error, stackTrace, reason);

  // setUserIdentifier(String userId) => Crashlytics().setUserIdentifier(userId);

  // sendScreen(screenName, screenClass) =>
  //     Analytics().sendScreen(screenName, screenClass);

  // sendUser(String userId) => Analytics().sendUser(userId);

  // sendCustomEvent(String eventName, Map<String, Object?> parameters) =>
  //     Analytics().sendCustomEvent(eventName, parameters);

  // setUserProperty(String name, String value) =>
  //     Analytics().setUserProperty(name, value);

  // void launchPhoneCall({required String phoneNumber}) async {
  //   final Uri callPhone = Uri(path: phoneNumber, scheme: 'tel');

  //   if (await canLaunchUrl(callPhone)) {
  //     launchUrl(callPhone);
  //   } else {
  //     throw 'no se puede lanzar';
  //   }
  // }

  // void launchEmail({required String email}) async {
  //   final Uri emailTo = Uri(
  //     scheme: 'mailto',
  //     path: email,
  //     query:
  //         'subject=Soporte!&body=Requiero soporte con la app supervisores Orbis',
  //   );
  //   try {
  //     await launchUrl(emailTo);
  //   } catch (e) {
  //     throw 'No se puede lanzar';
  //   }
  // }

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }

  Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor.toString();
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      String unknow = "unknown";
      String compilationNumber = androidDeviceInfo.id;
      String model = androidDeviceInfo.model;
      String board = androidDeviceInfo.board;

      String id = '';
      if (!compilationNumber.contains(unknow)) {
        id = compilationNumber;
      }
      if (!model.contains(unknow)) {
        id += model;
      }

      if (!board.contains(unknow)) {
        id += board;
      }
      return id.toUpperCase();
    }
  }

  Future<bool> getInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  String getCurrentDateWhitFormat(String format) {
    var now = DateTime.now();
    String formatter = DateFormat(format).format(now);
    return formatter;
  }

  Future<String> getAppDirectory() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String dirStringPath = dir.path;
    return dirStringPath;
  }

  Future<void> validateFiles(var zipFileBytes, var dirPath) async {
    var archive = ZipDecoder().decodeBytes(zipFileBytes);

    for (var file in archive) {
      String filePathEntry = '$dirPath/${file.name}';

      final File fileEntry = File(filePathEntry);

      await deleteDatabase(fileEntry.path);

      if (await fileEntry.exists()) {
        await fileEntry.delete();
      }
    }
  }

  Future<bool> deleteDb(String dbName) async {
    try {
      String dirStringPath = await Util.device.getAppDirectory();
      final dbFile = File('$dirStringPath/$dbName');

      await deleteDatabase(dbFile.path);

      if (await dbFile.exists()) {
        dbFile.delete();
      }
      return true;
    } catch (e) {
      Get.printError(info: "deleteDb -> $e");
      return false;
    }
  }

  Future<bool> deleteFilesDb() async {
    try {
      String dirStringPath = await Util.device.getAppDirectory();

      final dbFile = File('$dirStringPath/Database.db');
      if (await dbFile.exists()) {
        dbFile.delete();
      }

      final dbFileTemp = File('$dirStringPath/Temp.db');
      if (await dbFileTemp.exists()) {
        dbFileTemp.delete();
      }

      await deleteDbTmp();

      return true;
    } catch (e) {
      Get.printError(info: "deleteFilesDb -> $e");
      return false;
    }
  }

  Future<void> deleteDbTmp() async {
    try {
      String dirStringPath = await Util.device.getAppDirectory();
      final dbFile = File('$dirStringPath/Temp.db');

      await deleteDatabase(dbFile.path);

      if (await dbFile.exists()) {
        dbFile.delete();
      }
    } catch (e) {
      Get.printError(info: "deleteDbTmp -> $e");
    }
  }

  Future<void> copyFile() async {
    try {
      String dirStringPath = await Util.device.getAppDirectory();

      File file = File('$dirStringPath/Databse.db');
      File fileDestination = File('$dirStringPath/Temp.db');

      await file.copy(fileDestination.path);
    } catch (e) {
      Get.printError(info: "copyFile -> $e");
    }
  }

  Future<bool> isConectedInternet() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (e) {
      Get.printError(info: "isConectedInternet -> $e");
      return false;
    }
  }
}
