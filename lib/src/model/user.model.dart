class UserModel {
  String id;
  String name;

  UserModel(this.id, this.name);

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['_id'] != null) {
      id = json['_id'].toString();
    }
    name = json['name'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      'name': name,
    };
    if (id != null) {
      json['_id'] = id;
    }
    return json;
  }
}