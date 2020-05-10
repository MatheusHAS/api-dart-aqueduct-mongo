import 'package:my_awesome_api/my_awesome_api.dart';

Future main() async {
  final app = Application<MyAwesomeApiChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8888;

  final numberOfInstances = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: numberOfInstances > 0 ? numberOfInstances : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}