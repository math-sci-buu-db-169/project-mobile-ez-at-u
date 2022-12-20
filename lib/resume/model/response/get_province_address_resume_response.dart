import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"provincelist":[{"provinceid":10,"provincenameth":"กรุงเทพมหานคร","provincenameen":"Bangkok"},{"provinceid":11,"provincenameth":"สมุทรปราการ","provincenameen":"Samut Prakan"},{"provinceid":12,"provincenameth":"นนทบุรี","provincenameen":"Nonthaburi"},{"provinceid":13,"provincenameth":"ปทุมธานี","provincenameen":"Pathum Thani"},{"provinceid":14,"provincenameth":"พระนครศรีอยุธยา","provincenameen":"Phra Nakhon Si Ayutthaya"},{"provinceid":15,"provincenameth":"อ่างทอง","provincenameen":"Ang Thong"},{"provinceid":16,"provincenameth":"ลพบุรี","provincenameen":"Lop Buri"},{"provinceid":17,"provincenameth":"สิงห์บุรี","provincenameen":"Sing Buri"},{"provinceid":18,"provincenameth":"ชัยนาท","provincenameen":"Chai Nat"},{"provinceid":19,"provincenameth":"สระบุรี","provincenameen":"Saraburi"},{"provinceid":20,"provincenameth":"ชลบุรี","provincenameen":"Chon Buri"},{"provinceid":21,"provincenameth":"ระยอง","provincenameen":"Rayong"},{"provinceid":22,"provincenameth":"จันทบุรี","provincenameen":"Chanthaburi"},{"provinceid":23,"provincenameth":"ตราด","provincenameen":"Trat"},{"provinceid":24,"provincenameth":"ฉะเชิงเทรา","provincenameen":"Chachoengsao"},{"provinceid":25,"provincenameth":"ปราจีนบุรี","provincenameen":"Prachin Buri"},{"provinceid":26,"provincenameth":"นครนายก","provincenameen":"Nakhon Nayok"},{"provinceid":27,"provincenameth":"สระแก้ว","provincenameen":"Sa Kaeo"},{"provinceid":30,"provincenameth":"นครราชสีมา","provincenameen":"Nakhon Ratchasima"},{"provinceid":31,"provincenameth":"บุรีรัมย์","provincenameen":"Buri Ram"},{"provinceid":32,"provincenameth":"สุรินทร์","provincenameen":"Surin"},{"provinceid":33,"provincenameth":"ศรีสะเกษ","provincenameen":"Si Sa Ket"},{"provinceid":34,"provincenameth":"อุบลราชธานี","provincenameen":"Ubon Ratchathani"},{"provinceid":35,"provincenameth":"ยโสธร","provincenameen":"Yasothon"},{"provinceid":36,"provincenameth":"ชัยภูมิ","provincenameen":"Chaiyaphum"},{"provinceid":37,"provincenameth":"อำนาจเจริญ","provincenameen":"Amnat Charoen"},{"provinceid":38,"provincenameth":"บึงกาฬ","provincenameen":"Bueng Kan"},{"provinceid":39,"provincenameth":"หนองบัวลำภู","provincenameen":"Nong Bua Lam Phu"},{"provinceid":40,"provincenameth":"ขอนแก่น","provincenameen":"Khon Kaen"},{"provinceid":41,"provincenameth":"อุดรธานี","provincenameen":"Udon Thani"},{"provinceid":42,"provincenameth":"เลย","provincenameen":"Loei"},{"provinceid":43,"provincenameth":"หนองคาย","provincenameen":"Nong Khai"},{"provinceid":44,"provincenameth":"มหาสารคาม","provincenameen":"Maha Sarakham"},{"provinceid":45,"provincenameth":"ร้อยเอ็ด","provincenameen":"Roi Et"},{"provinceid":46,"provincenameth":"กาฬสินธุ์","provincenameen":"Kalasin"},{"provinceid":47,"provincenameth":"สกลนคร","provincenameen":"Sakon Nakhon"},{"provinceid":48,"provincenameth":"นครพนม","provincenameen":"Nakhon Phanom"},{"provinceid":49,"provincenameth":"มุกดาหาร","provincenameen":"Mukdahan"},{"provinceid":50,"provincenameth":"เชียงใหม่","provincenameen":"Chiang Mai"},{"provinceid":51,"provincenameth":"ลำพูน","provincenameen":"Lamphun"},{"provinceid":52,"provincenameth":"ลำปาง","provincenameen":"Lampang"},{"provinceid":53,"provincenameth":"อุตรดิตถ์","provincenameen":"Uttaradit"},{"provinceid":54,"provincenameth":"แพร่","provincenameen":"Phrae"},{"provinceid":55,"provincenameth":"น่าน","provincenameen":"Nan"},{"provinceid":56,"provincenameth":"พะเยา","provincenameen":"Phayao"},{"provinceid":57,"provincenameth":"เชียงราย","provincenameen":"Chiang Rai"},{"provinceid":58,"provincenameth":"แม่ฮ่องสอน","provincenameen":"Mae Hong Son"},{"provinceid":60,"provincenameth":"นครสวรรค์","provincenameen":"Nakhon Sawan"},{"provinceid":61,"provincenameth":"อุทัยธานี","provincenameen":"Uthai Thani"},{"provinceid":62,"provincenameth":"กำแพงเพชร","provincenameen":"Kamphaeng Phet"},{"provinceid":63,"provincenameth":"ตาก","provincenameen":"Tak"},{"provinceid":64,"provincenameth":"สุโขทัย","provincenameen":"Sukhothai"},{"provinceid":65,"provincenameth":"พิษณุโลก","provincenameen":"Phitsanulok"},{"provinceid":66,"provincenameth":"พิจิตร","provincenameen":"Phichit"},{"provinceid":67,"provincenameth":"เพชรบูรณ์","provincenameen":"Phetchabun"},{"provinceid":70,"provincenameth":"ราชบุรี","provincenameen":"Ratchaburi"},{"provinceid":71,"provincenameth":"กาญจนบุรี","provincenameen":"Kanchanaburi"},{"provinceid":72,"provincenameth":"สุพรรณบุรี","provincenameen":"Suphan Buri"},{"provinceid":73,"provincenameth":"นครปฐม","provincenameen":"Nakhon Pathom"},{"provinceid":74,"provincenameth":"สมุทรสาคร","provincenameen":"Samut Sakhon"},{"provinceid":75,"provincenameth":"สมุทรสงคราม","provincenameen":"Samut Songkhram"},{"provinceid":76,"provincenameth":"เพชรบุรี","provincenameen":"Phetchaburi"},{"provinceid":77,"provincenameth":"ประจวบคีรีขันธ์","provincenameen":"Prachuap Khiri Khan"},{"provinceid":80,"provincenameth":"นครศรีธรรมราช","provincenameen":"Nakhon Si Thammarat"},{"provinceid":81,"provincenameth":"กระบี่","provincenameen":"Krabi"},{"provinceid":82,"provincenameth":"พังงา","provincenameen":"Phangnga"},{"provinceid":83,"provincenameth":"ภูเก็ต","provincenameen":"Phuket"},{"provinceid":84,"provincenameth":"สุราษฎร์ธานี","provincenameen":"Surat Thani"},{"provinceid":85,"provincenameth":"ระนอง","provincenameen":"Ranong"},{"provinceid":86,"provincenameth":"ชุมพร","provincenameen":"Chumphon"},{"provinceid":90,"provincenameth":"สงขลา","provincenameen":"Songkhla"},{"provinceid":91,"provincenameth":"สตูล","provincenameen":"Satun"},{"provinceid":92,"provincenameth":"ตรัง","provincenameen":"Trang"},{"provinceid":93,"provincenameth":"พัทลุง","provincenameen":"Phatthalung"},{"provinceid":94,"provincenameth":"ปัตตานี","provincenameen":"Pattani"},{"provinceid":95,"provincenameth":"ยะลา","provincenameen":"Yala"},{"provinceid":96,"provincenameth":"นราธิวาส","provincenameen":"Narathiwat"}]}

GetProvinceAddressResumeResponse getProvinceAddressResumeResponseFromJson(String str) => GetProvinceAddressResumeResponse.fromJson(json.decode(str));
String getProvinceAddressResumeResponseToJson(GetProvinceAddressResumeResponse data) => json.encode(data.toJson());
class GetProvinceAddressResumeResponse {
  GetProvinceAddressResumeResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  GetProvinceAddressResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
GetProvinceAddressResumeResponse copyWith({  Head? head,
  Body? body,
}) => GetProvinceAddressResumeResponse(  head: head ?? _head,
  body: body ?? _body,
);
  Head? get head => _head;
  Body? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_head != null) {
      map['head'] = _head?.toJson();
    }
    if (_body != null) {
      map['body'] = _body?.toJson();
    }
    return map;
  }

}

/// provincelist : [{"provinceid":10,"provincenameth":"กรุงเทพมหานคร","provincenameen":"Bangkok"},{"provinceid":11,"provincenameth":"สมุทรปราการ","provincenameen":"Samut Prakan"},{"provinceid":12,"provincenameth":"นนทบุรี","provincenameen":"Nonthaburi"},{"provinceid":13,"provincenameth":"ปทุมธานี","provincenameen":"Pathum Thani"},{"provinceid":14,"provincenameth":"พระนครศรีอยุธยา","provincenameen":"Phra Nakhon Si Ayutthaya"},{"provinceid":15,"provincenameth":"อ่างทอง","provincenameen":"Ang Thong"},{"provinceid":16,"provincenameth":"ลพบุรี","provincenameen":"Lop Buri"},{"provinceid":17,"provincenameth":"สิงห์บุรี","provincenameen":"Sing Buri"},{"provinceid":18,"provincenameth":"ชัยนาท","provincenameen":"Chai Nat"},{"provinceid":19,"provincenameth":"สระบุรี","provincenameen":"Saraburi"},{"provinceid":20,"provincenameth":"ชลบุรี","provincenameen":"Chon Buri"},{"provinceid":21,"provincenameth":"ระยอง","provincenameen":"Rayong"},{"provinceid":22,"provincenameth":"จันทบุรี","provincenameen":"Chanthaburi"},{"provinceid":23,"provincenameth":"ตราด","provincenameen":"Trat"},{"provinceid":24,"provincenameth":"ฉะเชิงเทรา","provincenameen":"Chachoengsao"},{"provinceid":25,"provincenameth":"ปราจีนบุรี","provincenameen":"Prachin Buri"},{"provinceid":26,"provincenameth":"นครนายก","provincenameen":"Nakhon Nayok"},{"provinceid":27,"provincenameth":"สระแก้ว","provincenameen":"Sa Kaeo"},{"provinceid":30,"provincenameth":"นครราชสีมา","provincenameen":"Nakhon Ratchasima"},{"provinceid":31,"provincenameth":"บุรีรัมย์","provincenameen":"Buri Ram"},{"provinceid":32,"provincenameth":"สุรินทร์","provincenameen":"Surin"},{"provinceid":33,"provincenameth":"ศรีสะเกษ","provincenameen":"Si Sa Ket"},{"provinceid":34,"provincenameth":"อุบลราชธานี","provincenameen":"Ubon Ratchathani"},{"provinceid":35,"provincenameth":"ยโสธร","provincenameen":"Yasothon"},{"provinceid":36,"provincenameth":"ชัยภูมิ","provincenameen":"Chaiyaphum"},{"provinceid":37,"provincenameth":"อำนาจเจริญ","provincenameen":"Amnat Charoen"},{"provinceid":38,"provincenameth":"บึงกาฬ","provincenameen":"Bueng Kan"},{"provinceid":39,"provincenameth":"หนองบัวลำภู","provincenameen":"Nong Bua Lam Phu"},{"provinceid":40,"provincenameth":"ขอนแก่น","provincenameen":"Khon Kaen"},{"provinceid":41,"provincenameth":"อุดรธานี","provincenameen":"Udon Thani"},{"provinceid":42,"provincenameth":"เลย","provincenameen":"Loei"},{"provinceid":43,"provincenameth":"หนองคาย","provincenameen":"Nong Khai"},{"provinceid":44,"provincenameth":"มหาสารคาม","provincenameen":"Maha Sarakham"},{"provinceid":45,"provincenameth":"ร้อยเอ็ด","provincenameen":"Roi Et"},{"provinceid":46,"provincenameth":"กาฬสินธุ์","provincenameen":"Kalasin"},{"provinceid":47,"provincenameth":"สกลนคร","provincenameen":"Sakon Nakhon"},{"provinceid":48,"provincenameth":"นครพนม","provincenameen":"Nakhon Phanom"},{"provinceid":49,"provincenameth":"มุกดาหาร","provincenameen":"Mukdahan"},{"provinceid":50,"provincenameth":"เชียงใหม่","provincenameen":"Chiang Mai"},{"provinceid":51,"provincenameth":"ลำพูน","provincenameen":"Lamphun"},{"provinceid":52,"provincenameth":"ลำปาง","provincenameen":"Lampang"},{"provinceid":53,"provincenameth":"อุตรดิตถ์","provincenameen":"Uttaradit"},{"provinceid":54,"provincenameth":"แพร่","provincenameen":"Phrae"},{"provinceid":55,"provincenameth":"น่าน","provincenameen":"Nan"},{"provinceid":56,"provincenameth":"พะเยา","provincenameen":"Phayao"},{"provinceid":57,"provincenameth":"เชียงราย","provincenameen":"Chiang Rai"},{"provinceid":58,"provincenameth":"แม่ฮ่องสอน","provincenameen":"Mae Hong Son"},{"provinceid":60,"provincenameth":"นครสวรรค์","provincenameen":"Nakhon Sawan"},{"provinceid":61,"provincenameth":"อุทัยธานี","provincenameen":"Uthai Thani"},{"provinceid":62,"provincenameth":"กำแพงเพชร","provincenameen":"Kamphaeng Phet"},{"provinceid":63,"provincenameth":"ตาก","provincenameen":"Tak"},{"provinceid":64,"provincenameth":"สุโขทัย","provincenameen":"Sukhothai"},{"provinceid":65,"provincenameth":"พิษณุโลก","provincenameen":"Phitsanulok"},{"provinceid":66,"provincenameth":"พิจิตร","provincenameen":"Phichit"},{"provinceid":67,"provincenameth":"เพชรบูรณ์","provincenameen":"Phetchabun"},{"provinceid":70,"provincenameth":"ราชบุรี","provincenameen":"Ratchaburi"},{"provinceid":71,"provincenameth":"กาญจนบุรี","provincenameen":"Kanchanaburi"},{"provinceid":72,"provincenameth":"สุพรรณบุรี","provincenameen":"Suphan Buri"},{"provinceid":73,"provincenameth":"นครปฐม","provincenameen":"Nakhon Pathom"},{"provinceid":74,"provincenameth":"สมุทรสาคร","provincenameen":"Samut Sakhon"},{"provinceid":75,"provincenameth":"สมุทรสงคราม","provincenameen":"Samut Songkhram"},{"provinceid":76,"provincenameth":"เพชรบุรี","provincenameen":"Phetchaburi"},{"provinceid":77,"provincenameth":"ประจวบคีรีขันธ์","provincenameen":"Prachuap Khiri Khan"},{"provinceid":80,"provincenameth":"นครศรีธรรมราช","provincenameen":"Nakhon Si Thammarat"},{"provinceid":81,"provincenameth":"กระบี่","provincenameen":"Krabi"},{"provinceid":82,"provincenameth":"พังงา","provincenameen":"Phangnga"},{"provinceid":83,"provincenameth":"ภูเก็ต","provincenameen":"Phuket"},{"provinceid":84,"provincenameth":"สุราษฎร์ธานี","provincenameen":"Surat Thani"},{"provinceid":85,"provincenameth":"ระนอง","provincenameen":"Ranong"},{"provinceid":86,"provincenameth":"ชุมพร","provincenameen":"Chumphon"},{"provinceid":90,"provincenameth":"สงขลา","provincenameen":"Songkhla"},{"provinceid":91,"provincenameth":"สตูล","provincenameen":"Satun"},{"provinceid":92,"provincenameth":"ตรัง","provincenameen":"Trang"},{"provinceid":93,"provincenameth":"พัทลุง","provincenameen":"Phatthalung"},{"provinceid":94,"provincenameth":"ปัตตานี","provincenameen":"Pattani"},{"provinceid":95,"provincenameth":"ยะลา","provincenameen":"Yala"},{"provinceid":96,"provincenameth":"นราธิวาส","provincenameen":"Narathiwat"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      List<Provincelist>? provincelist,}){
    _provincelist = provincelist;
}

  Body.fromJson(dynamic json) {
    if (json['provincelist'] != null) {
      _provincelist = [];
      json['provincelist'].forEach((v) {
        _provincelist?.add(Provincelist.fromJson(v));
      });
    }
  }
  List<Provincelist>? _provincelist;
Body copyWith({  List<Provincelist>? provincelist,
}) => Body(  provincelist: provincelist ?? _provincelist,
);
  List<Provincelist>? get provincelist => _provincelist;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_provincelist != null) {
      map['provincelist'] = _provincelist?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// provinceid : 10
/// provincenameth : "กรุงเทพมหานคร"
/// provincenameen : "Bangkok"

Provincelist provincelistFromJson(String str) => Provincelist.fromJson(json.decode(str));
String provincelistToJson(Provincelist data) => json.encode(data.toJson());
class Provincelist {
  Provincelist({
      int? provinceid, 
      String? provincenameth, 
      String? provincenameen,}){
    _provinceid = provinceid;
    _provincenameth = provincenameth;
    _provincenameen = provincenameen;
}

  Provincelist.fromJson(dynamic json) {
    _provinceid = json['provinceid'];
    _provincenameth = json['provincenameth'];
    _provincenameen = json['provincenameen'];
  }
  int? _provinceid;
  String? _provincenameth;
  String? _provincenameen;
Provincelist copyWith({  int? provinceid,
  String? provincenameth,
  String? provincenameen,
}) => Provincelist(  provinceid: provinceid ?? _provinceid,
  provincenameth: provincenameth ?? _provincenameth,
  provincenameen: provincenameen ?? _provincenameen,
);
  int? get provinceid => _provinceid;
  String? get provincenameth => _provincenameth;
  String? get provincenameen => _provincenameen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['provinceid'] = _provinceid;
    map['provincenameth'] = _provincenameth;
    map['provincenameen'] = _provincenameen;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "home/resume"
/// timeexpire : false

Head headFromJson(String str) => Head.fromJson(json.decode(str));
String headToJson(Head data) => json.encode(data.toJson());
class Head {
  Head({
      int? status, 
      String? message, 
      String? modulename, 
      bool? timeexpire,}){
    _status = status;
    _message = message;
    _modulename = modulename;
    _timeexpire = timeexpire;
}

  Head.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _modulename = json['modulename'];
    _timeexpire = json['timeexpire'];
  }
  int? _status;
  String? _message;
  String? _modulename;
  bool? _timeexpire;
Head copyWith({  int? status,
  String? message,
  String? modulename,
  bool? timeexpire,
}) => Head(  status: status ?? _status,
  message: message ?? _message,
  modulename: modulename ?? _modulename,
  timeexpire: timeexpire ?? _timeexpire,
);
  int? get status => _status;
  String? get message => _message;
  String? get modulename => _modulename;
  bool? get timeexpire => _timeexpire;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['modulename'] = _modulename;
    map['timeexpire'] = _timeexpire;
    return map;
  }

}