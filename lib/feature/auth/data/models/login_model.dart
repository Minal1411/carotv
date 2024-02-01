class LoginModel {
  LoginModel({
    Data? data,
  }) {
    _data = data;
  }

  LoginModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;
  LoginModel copyWith({
    Data? data,
  }) =>
      LoginModel(
        data: data ?? _data,
      );
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    int? userId,
    String? username,
    String? userEmail,
    String? signupDate,
    String? name,
    String? userImage,
    String? telephone,
    bool? isActive,
    String? address,
    bool? isEmailVerified,
    String? token,
    String? refreshToken,
    bool? premium,
    String? supportMessage,
    String? userUniqueId,
  }) {
    _userId = userId;
    _username = username;
    _userEmail = userEmail;
    _signupDate = signupDate;
    _name = name;
    _userImage = userImage;
    _telephone = telephone;
    _isActive = isActive;
    _address = address;
    _isEmailVerified = isEmailVerified;
    _token = token;
    _refreshToken = refreshToken;
    _premium = premium;
    _supportMessage = supportMessage;
    _userUniqueId = userUniqueId;
  }

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _username = json['username'];
    _userEmail = json['user_email'];
    _signupDate = json['signup_date'];
    _name = json['name'];
    _userImage = json['user_image'];
    _telephone = json['telephone'];
    _isActive = json['isActive'];
    _address = json['address'];
    _isEmailVerified = json['is_email_verified'];
    _token = json['token'];
    _refreshToken = json['refresh_token'];
    _premium = json['premium'];
    _supportMessage = json['support_message'];
    _userUniqueId = json['user_unique_id'];
  }
  int? _userId;
  String? _username;
  String? _userEmail;
  String? _signupDate;
  String? _name;
  String? _userImage;
  String? _telephone;
  bool? _isActive;
  String? _address;
  bool? _isEmailVerified;
  String? _token;
  String? _refreshToken;
  bool? _premium;
  String? _supportMessage;
  String? _userUniqueId;
  Data copyWith({
    int? userId,
    String? username,
    String? userEmail,
    String? signupDate,
    String? name,
    String? userImage,
    String? telephone,
    bool? isActive,
    String? address,
    bool? isEmailVerified,
    String? token,
    String? refreshToken,
    bool? premium,
    String? supportMessage,
    String? userUniqueId,
  }) =>
      Data(
        userId: userId ?? _userId,
        username: username ?? _username,
        userEmail: userEmail ?? _userEmail,
        signupDate: signupDate ?? _signupDate,
        name: name ?? _name,
        userImage: userImage ?? _userImage,
        telephone: telephone ?? _telephone,
        isActive: isActive ?? _isActive,
        address: address ?? _address,
        isEmailVerified: isEmailVerified ?? _isEmailVerified,
        token: token ?? _token,
        refreshToken: refreshToken ?? _refreshToken,
        premium: premium ?? _premium,
        supportMessage: supportMessage ?? _supportMessage,
        userUniqueId: userUniqueId ?? _userUniqueId,
      );
  int? get userId => _userId;
  String? get username => _username;
  String? get userEmail => _userEmail;
  String? get signupDate => _signupDate;
  String? get name => _name;
  String? get userImage => _userImage;
  String? get telephone => _telephone;
  bool? get isActive => _isActive;
  String? get address => _address;
  bool? get isEmailVerified => _isEmailVerified;
  String? get token => _token;
  String? get refreshToken => _refreshToken;
  bool? get premium => _premium;
  String? get supportMessage => _supportMessage;
  String? get userUniqueId => _userUniqueId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['username'] = _username;
    map['user_email'] = _userEmail;
    map['signup_date'] = _signupDate;
    map['name'] = _name;
    map['user_image'] = _userImage;
    map['telephone'] = _telephone;
    map['isActive'] = _isActive;
    map['address'] = _address;
    map['is_email_verified'] = _isEmailVerified;
    map['token'] = _token;
    map['refresh_token'] = _refreshToken;
    map['premium'] = _premium;
    map['support_message'] = _supportMessage;
    map['user_unique_id'] = _userUniqueId;
    return map;
  }
}
