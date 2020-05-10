# api-dart-aqueduct-mongo
Test of Aqueduct, a dart framework to host a multi-threaded http server.

## Dependencies
- [Dart SDK](https://dart.dev/get-dart)
- [MongoDB](https://docs.mongodb.com/manual/installation/)

## Install\Enable Aqueduct
```bash
$ pub global activate aqueduct
```

## Install packages
```bash
$ pub get
```

## Run
```bash
$ pub run aqueduct serve
```

Server running in
```
http://localhost:8888
```

# Routes

## List all users
```
[GET] /api/user
```
When error: Status Code `404`

When success: Status Code `200`
```json
{
  "body": [
    {
      "_id": "ObjectId(\"5eb833f9d88ad3aaa371f11d\")",
      "name": "Foo bar"
    }
  ]
}
```

## Get user By ObjectId
```
[GET] /api/user/{UserObjectId}
```
When error: Status Code `404`

When success: Status Code `200`
```json
{
  "_id": "ObjectId(\"5eb833f9d88ad3aaa371f11d\")",
  "name": "Foo bar"
}
```

## Update user
```
[POST] /api/user/{UserObjectId}
```
To update, send user data in body request (JSON):
```json
{
  "name": "Update my Name plz"
}
```

When error: Status Code `500`

When success: Status Code `200`
```json
{
  "success": true
}
```


## Insert user
```
[POST] /api/user
```
To insert new user, send user data in body request (JSON):
```json
{
  "name": "Foo bar"
}
```

When error: Status Code `500`

When success: Status Code `200`
```json
{
  "success": true
}
```

## Delete user
```
[DELETE] /api/user/{UserObjectId}
```

When error: Status Code `500`

When success: Status Code `200`
```json
{
  "success": true
}
```