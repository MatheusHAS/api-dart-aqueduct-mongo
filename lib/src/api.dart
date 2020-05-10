import 'package:my_awesome_api/my_awesome_api.dart';
import 'package:my_awesome_api/src/controller/user.controller.dart';
import 'package:my_awesome_api/src/helpers/app.config.dart';
import 'package:mongo_dart/mongo_dart.dart';


class MyAwesomeApiChannel extends ApplicationChannel {
  String apiBaseUrl = '';
  Db dbConnection;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final AppConfiguration appConfig = AppConfiguration("config.yaml");
    apiBaseUrl = appConfig.api_base_url;
    dbConnection = Db(appConfig.mongo_uri);
    await dbConnection.open();
  }

  @override
  Future close() async{
    await super.close();
    await dbConnection.close();
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route('$apiBaseUrl/user[/:id]').link(() => UserController(dbConnection, 'user'));

    return router;
  }
}
