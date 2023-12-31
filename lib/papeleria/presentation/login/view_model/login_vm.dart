import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../../infraestructure/data/local/sqlite/base_sqlite_service.dart';
import '../../../infraestructure/data/local/sqlite/sqlite_service.dart';

class LoginViewModel extends GetxController {
  //
  //
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> login() async {
    /*
    if (userController.text == 'admin' && passwordController.text == 'admin') {
      return true;
    }
    return false;*/
    if (await loginRepo()) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> loginRepo() async {
    BaseSqliteService sqliteService = SqliteService();
    Database db = await sqliteService.openDB('Database.db');

    try {
      String statement = '''
        SELECT * FROM usuario 
        WHERE nombreUsuario = ? AND contrasenaUsuario = ?
      ''';

      List<Map<String, dynamic>> result = await db
          .rawQuery(statement, [userController.text, passwordController.text]);

      // Si la consulta devuelve al menos una fila, las credenciales son válidas.
      return result.isNotEmpty;
    } catch (e) {
      print('Error en la consulta de login: $e');
      return false;
    } finally {
      await db.close();
    }
  }

  static LoginViewModel get findOrInitialize {
    try {
      return Get.find<LoginViewModel>();
    } catch (e) {
      Get.put(LoginViewModel());
      return Get.find<LoginViewModel>();
    }
  }
}
