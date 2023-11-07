class Const {
  //Carpetas de archivos
  static const String dbName = 'DB7037.db';
  static const String dbNameTemp = 'Temp.db';

  //Versiones de la Aplicacion
  static const int pruebas = 1;
  static const int produccion = 2;

  static const int typeService = 1;
  static const int typeSync = 2;
  static const int typePayWompi = 3;

// url para descargar app
  //static const String urlAndroidStore =
  //    'https://play.google.com/store/apps/details?id=misurtii.grupo.exito';
  //static const String urlIosStore =
  //    'https://apps.apple.com/co/app/mobile_b2bid1568719629?l=en';

  //Variable que indica en que ambiente se va a desplegar
  bool isDebug = false;
  String urlImgs = "";
  String port = "";
  String baseService = "";
  String baseSync = "";
  String baseWompi = "";
  bool cert = false;
  String pathSync = "";
  String pathService = "";
  String pathWompi = "";
  String titulo = "";
  String nameDirApp = "";
  String usuarioPqr = "";

  //Contantes para identificar la plataforma
  static const int android = 1;
  static const int ios = 2;

  static const int aplication = pruebas;

  Const() {
    switch (aplication) {
      case pruebas:
        titulo = "Pruebas";
        nameDirApp = "OrbisPruebas";
        port = "";
        cert = true;
        baseWompi = "api1.cwmovilidad.com";
        pathWompi = "wompi_produccion/api";

        baseService = "emartwebapi.celuwebdev.com";
        baseSync = "66.33.94.57";
        pathSync = "SyncOrbisB2B";
        pathService = "orbis_hex_web_api";
        urlImgs = "http://66.33.94.57/FuerzaVentas/Catalogo/";
        isDebug = true;
        break;

      case produccion:
        titulo = "Produccion";
        nameDirApp = "B2CExitoAliados";
        //port = "8143";
        cert = true;
        baseWompi = "api1.cwmovilidad.com";
        pathWompi = "wompi_produccion/api";
        baseService = "pasarela.grupo-exito.com";
        baseSync = "pasarela.grupo-exito.com";
        pathSync = "SyncB2CExitoAliados";
        pathService = "ServiceB2CAliados/api";
        usuarioPqr = "18895";
        urlImgs = "https://pasarela.grupo-exito.com:8143/Aliados/Imagenes/";
        isDebug = false;
        break;

      default:
        titulo = "";
        nameDirApp = "";
        port = "";
        cert = false;
        baseService = "";
        baseSync = "";
        pathSync = "";
        pathService = "";
        usuarioPqr = "";
        urlImgs = "";
        isDebug = false;
        break;
    }
  }
}



//'http://66.33.94.57/SyncOrbisB2B/CrearDBPrv.aspx'
//
//'http://66.33.94.57/FuerzaVentas/7037/bd/DbPrv.zip' -- db quemada
