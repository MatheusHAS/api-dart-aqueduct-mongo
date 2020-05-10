import 'package:my_awesome_api/my_awesome_api.dart';
import 'package:my_awesome_api/src/mixins/controller.mixin.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:my_awesome_api/src/model/user.model.dart';


class UserController extends ResourceController implements ControllerMixin {
  Db dbInstance;
  DbCollection collectionInstance;

  UserController(Db dbConnection, String collectionName) {
    dbInstance = dbConnection;
    collectionInstance = dbInstance.collection(collectionName);
  }

  @override
  @Operation.get()
  Future<Response> getAll() async {
    final findResult = await collectionInstance.find().toList();
    
    final List<UserModel> responseBody = findResult.map(
      (Map<String, dynamic> user) => UserModel.fromJson(user)
    ).toList();
    
    return Response.ok({
      'body': responseBody,
    });
  }

  @override
  @Operation.get('id')
  Future<Response> getByID(@Bind.path('id') ObjectId userId) async {
    final Map<String, dynamic> findResult = await collectionInstance.findOne(where.id(userId));

    if (findResult != null) {
      return Response.ok(UserModel.fromJson(findResult));
    }

    return Response.notFound();
  }

  @override
  @Operation.post()
  Future<Response> create() async {
    final Map<String, dynamic> requestBody = await request.body.decode();
    final UserModel newUser = UserModel.fromJson(requestBody);
    
    final Map<String, dynamic> responseBody = newUser.toJson();
    
    await collectionInstance.insert(responseBody);

    return Response.ok({
      'success': true,
    });
  }

  @override
  @Operation.post('id')
  Future<Response> update(@Bind.path('id') ObjectId userId) async {
    final Map<String, dynamic> requestBody = await request.body.decode();
    final UserModel userToUpdate = UserModel.fromJson(requestBody);

    await collectionInstance.update(where.id(userId), userToUpdate.toJson());
    return Response.ok({
      'success': true,
    });
  }

  @override
  @Operation.delete('id')
  Future<Response> delete(@Bind.path('id') ObjectId userId) async {
    final Map<String, dynamic> findResult = await collectionInstance.findOne(where.id(userId));

    if (findResult != null) {
      await collectionInstance.remove(where.id(userId));
      return Response.ok({
        'success': true,
      });
    }

    return Response.notFound();
  }

}
