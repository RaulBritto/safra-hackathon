class User {
  String _accountId;
  String _password;
  String _nickname;
  User(this._accountId, this._password, this._nickname);

  User.map(dynamic obj) {
    this._accountId = obj["accountId"];
    this._password = obj["password"];
    this._nickname = obj["nickname"];
  }

  String get accountId => _accountId;
  String get password => _password;
  String get nickname => _nickname;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["accountId"] = _accountId;
    map["password"] = _password;
    map["nickname"] = _nickname;

    return map;
  }
}