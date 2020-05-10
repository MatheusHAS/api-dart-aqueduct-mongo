import 'package:my_awesome_api/my_awesome_api.dart';

class AppConfiguration extends Configuration {
  AppConfiguration(String filePath) : super.fromFile(File(filePath));

  String mongo_uri;
  String api_base_url;
}