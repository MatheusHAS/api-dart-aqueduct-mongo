import 'package:my_awesome_api/my_awesome_api.dart';
import 'package:mongo_dart/mongo_dart.dart';

mixin ControllerMixin {

  @Operation.get()
  Future<Response> getAll();

  @Operation.get('id')
  Future<Response> getByID(@Bind.path('id') ObjectId id);

  @Operation.post()
  Future<Response> create();

  @Operation.post('id')
  Future<Response> update(@Bind.path('id') ObjectId id);

  @Operation.delete('id')
  Future<Response> delete(@Bind.path('id') ObjectId id);

}
