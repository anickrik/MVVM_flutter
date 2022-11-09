/// status : "200"
/// message : "Profile updated successfully."
/// result : {"userInfo":{"firstName":"Kishan","lastName":"Chotaliya","userCode":"025E8AFE","email":"kishan@e2logy.com","mobileNumber":"0499999999","aesPassKey":"6ec8b1e5fc0549eae26ff8df02757e6e","profileImage":"https://d34qh8xsbo6jjx.cloudfront.net/uploads/member/thumb/1824be005a906fed1667970433.png","unitNo":"","address":"","suburb":"","postCode":"","regionId":"","headerToken":"b6YmKSWn98UJZ2u0/pgNU8w8Ncdt69UNokY7eepliOU="}}
/// notificationCount : 101
/// cartCount : 1

class FlashUserModel {
  FlashUserModel({
      String? status, 
      String? message, 
      Result? result, 
      num? notificationCount, 
      num? cartCount,}){
    _status = status;
    _message = message;
    _result = result;
    _notificationCount = notificationCount;
    _cartCount = cartCount;
}

  FlashUserModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _notificationCount = json['notificationCount'];
    _cartCount = json['cartCount'];
  }
  String? _status;
  String? _message;
  Result? _result;
  num? _notificationCount;
  num? _cartCount;
FlashUserModel copyWith({  String? status,
  String? message,
  Result? result,
  num? notificationCount,
  num? cartCount,
}) => FlashUserModel(  status: status ?? _status,
  message: message ?? _message,
  result: result ?? _result,
  notificationCount: notificationCount ?? _notificationCount,
  cartCount: cartCount ?? _cartCount,
);
  String? get status => _status;
  String? get message => _message;
  Result? get result => _result;
  num? get notificationCount => _notificationCount;
  num? get cartCount => _cartCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    map['notificationCount'] = _notificationCount;
    map['cartCount'] = _cartCount;
    return map;
  }

}

/// userInfo : {"firstName":"Kishan","lastName":"Chotaliya","userCode":"025E8AFE","email":"kishan@e2logy.com","mobileNumber":"0499999999","aesPassKey":"6ec8b1e5fc0549eae26ff8df02757e6e","profileImage":"https://d34qh8xsbo6jjx.cloudfront.net/uploads/member/thumb/1824be005a906fed1667970433.png","unitNo":"","address":"","suburb":"","postCode":"","regionId":"","headerToken":"b6YmKSWn98UJZ2u0/pgNU8w8Ncdt69UNokY7eepliOU="}

class Result {
  Result({
      UserInfo? userInfo,}){
    _userInfo = userInfo;
}

  Result.fromJson(dynamic json) {
    _userInfo = json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
  }
  UserInfo? _userInfo;
Result copyWith({  UserInfo? userInfo,
}) => Result(  userInfo: userInfo ?? _userInfo,
);
  UserInfo? get userInfo => _userInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userInfo != null) {
      map['userInfo'] = _userInfo?.toJson();
    }
    return map;
  }

}

/// firstName : "Kishan"
/// lastName : "Chotaliya"
/// userCode : "025E8AFE"
/// email : "kishan@e2logy.com"
/// mobileNumber : "0499999999"
/// aesPassKey : "6ec8b1e5fc0549eae26ff8df02757e6e"
/// profileImage : "https://d34qh8xsbo6jjx.cloudfront.net/uploads/member/thumb/1824be005a906fed1667970433.png"
/// unitNo : ""
/// address : ""
/// suburb : ""
/// postCode : ""
/// regionId : ""
/// headerToken : "b6YmKSWn98UJZ2u0/pgNU8w8Ncdt69UNokY7eepliOU="

class UserInfo {
  UserInfo({
      String? firstName, 
      String? lastName, 
      String? userCode, 
      String? email, 
      String? mobileNumber, 
      String? aesPassKey, 
      String? profileImage, 
      String? unitNo, 
      String? address, 
      String? suburb, 
      String? postCode, 
      String? regionId, 
      String? headerToken,}){
    _firstName = firstName;
    _lastName = lastName;
    _userCode = userCode;
    _email = email;
    _mobileNumber = mobileNumber;
    _aesPassKey = aesPassKey;
    _profileImage = profileImage;
    _unitNo = unitNo;
    _address = address;
    _suburb = suburb;
    _postCode = postCode;
    _regionId = regionId;
    _headerToken = headerToken;
}

  UserInfo.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _userCode = json['userCode'];
    _email = json['email'];
    _mobileNumber = json['mobileNumber'];
    _aesPassKey = json['aesPassKey'];
    _profileImage = json['profileImage'];
    _unitNo = json['unitNo'];
    _address = json['address'];
    _suburb = json['suburb'];
    _postCode = json['postCode'];
    _regionId = json['regionId'];
    _headerToken = json['headerToken'];
  }
  String? _firstName;
  String? _lastName;
  String? _userCode;
  String? _email;
  String? _mobileNumber;
  String? _aesPassKey;
  String? _profileImage;
  String? _unitNo;
  String? _address;
  String? _suburb;
  String? _postCode;
  String? _regionId;
  String? _headerToken;
UserInfo copyWith({  String? firstName,
  String? lastName,
  String? userCode,
  String? email,
  String? mobileNumber,
  String? aesPassKey,
  String? profileImage,
  String? unitNo,
  String? address,
  String? suburb,
  String? postCode,
  String? regionId,
  String? headerToken,
}) => UserInfo(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  userCode: userCode ?? _userCode,
  email: email ?? _email,
  mobileNumber: mobileNumber ?? _mobileNumber,
  aesPassKey: aesPassKey ?? _aesPassKey,
  profileImage: profileImage ?? _profileImage,
  unitNo: unitNo ?? _unitNo,
  address: address ?? _address,
  suburb: suburb ?? _suburb,
  postCode: postCode ?? _postCode,
  regionId: regionId ?? _regionId,
  headerToken: headerToken ?? _headerToken,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get userCode => _userCode;
  String? get email => _email;
  String? get mobileNumber => _mobileNumber;
  String? get aesPassKey => _aesPassKey;
  String? get profileImage => _profileImage;
  String? get unitNo => _unitNo;
  String? get address => _address;
  String? get suburb => _suburb;
  String? get postCode => _postCode;
  String? get regionId => _regionId;
  String? get headerToken => _headerToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['userCode'] = _userCode;
    map['email'] = _email;
    map['mobileNumber'] = _mobileNumber;
    map['aesPassKey'] = _aesPassKey;
    map['profileImage'] = _profileImage;
    map['unitNo'] = _unitNo;
    map['address'] = _address;
    map['suburb'] = _suburb;
    map['postCode'] = _postCode;
    map['regionId'] = _regionId;
    map['headerToken'] = _headerToken;
    return map;
  }

}