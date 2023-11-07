import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:software2/_iatech/infraestructure/data/local/i_unzip.dart';
import 'package:software2/_iatech/infraestructure/data/local/unzip_repository.dart';

import 'package:software2/shared/util/util.dart';
import 'package:path/path.dart' as p;

import 'package:sqflite/sqflite.dart';

import 'base_sqlite_service.dart';

class SqliteService extends BaseSqliteService {
  @override
  Future<bool> saveDBZip(Uint8List bytes) async {
    String zipName = 'DbPrv.zip';

    try {
      String dirStringPath = await Util.device.getAppDirectory();

      File file = File('$dirStringPath/$zipName');

      if (await file.exists()) {
        await file.delete();
      }

      await Util.device.validateFiles(bytes, dirStringPath);

      await file.writeAsBytes(bytes);

      IUnZip unZip = UnZipRepository();
      await unZip.unzipFile(dirStringPath, zipName);
    } catch (e) {
      Get.printError(info: 'saveDBZip -> $e');
      // Util.device
      //     .nonFatalError(e, StackTrace.current, "saveDBZip -> error con db");
      return false;
    }

    return true;
  }

  @override
  Future<Database?> openDB(String db) async {
    String dirStringPath = await Util.device.getAppDirectory();

    File file = File(p.join(dirStringPath, db));
    if (await file.exists()) {
      return await openDatabase(p.join(dirStringPath, db));
    } else {
      await copyDatabaseFromAssets(db);
      return await openDatabase(p.join(dirStringPath, db));
    }
  }

  @override
  Future closeDB(Database db) async {
    await db.close();
  }

  @override
  Future<String> compressFileTemp() async {
    var encoder = ZipFileEncoder();

    String zipName = 'Temp.zip';
    String dirStringPath = await Util.device.getAppDirectory();

    File file = File('$dirStringPath/$zipName');
    File fileToCompress = File('$dirStringPath/temp.db');

    if (await file.exists()) {
      await file.delete();
    }

    encoder.create(file.path);
    await encoder.addFile(File(fileToCompress.path));
    encoder.close();

    return file.path;
  }

  Future<void> copyDatabaseFromAssets(String db) async {
    String dirStringPath = await Util.device.getAppDirectory();

    File file = File(p.join(dirStringPath, db));
    if (!await file.exists()) {
      ByteData data = await rootBundle.load('databases/$db');
      List<int> bytes = data.buffer.asUint8List();

      await file.writeAsBytes(bytes);
    }
  }
}
