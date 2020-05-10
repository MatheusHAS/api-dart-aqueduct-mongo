import 'package:my_awesome_api/my_awesome_api.dart';
import 'package:aqueduct_test/aqueduct_test.dart';

export 'package:my_awesome_api/my_awesome_api.dart';
export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:test/test.dart';
export 'package:aqueduct/aqueduct.dart';

class Harness extends TestHarness<MyAwesomeApiChannel> {
  @override
  Future onSetUp() async {

  }

  @override
  Future onTearDown() async {

  }
}
