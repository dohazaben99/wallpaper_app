
class MenueItemModel {
  MenueItemModel({
      num? id, 
      num? fnId, 
      String? enabled, 
      String? visible, 
      num? ord, 
      num? parent, 
      String? caption, 
      String? ecaption, 
      List<Children>? children, 
      FunctionName? functionName,}){
    _id = id;
    _fnId = fnId;
    _enabled = enabled;
    _visible = visible;
    _ord = ord;
    _parent = parent;
    _caption = caption;
    _ecaption = ecaption;
    _children = children;
    _functionName = functionName;
}

  MenueItemModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fnId = json['fn_id'];
    _enabled = json['enabled'];
    _visible = json['visible'];
    _ord = json['ord'];
    _parent = json['parent'];
    _caption = json['caption'];
    _ecaption = json['ecaption'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(Children.fromJson(v));
      });
    }
    _functionName = json['function_name'] != null ? FunctionName.fromJson(json['function_name']) : null;
  }
  num? _id;
  num? _fnId;
  String? _enabled;
  String? _visible;
  num? _ord;
  num? _parent;
  String? _caption;
  String? _ecaption;
  List<Children>? _children;
  FunctionName? _functionName;
MenueItemModel copyWith({  num? id,
  num? fnId,
  String? enabled,
  String? visible,
  num? ord,
  num? parent,
  String? caption,
  String? ecaption,
  List<Children>? children,
  FunctionName? functionName,
}) => MenueItemModel(  id: id ?? _id,
  fnId: fnId ?? _fnId,
  enabled: enabled ?? _enabled,
  visible: visible ?? _visible,
  ord: ord ?? _ord,
  parent: parent ?? _parent,
  caption: caption ?? _caption,
  ecaption: ecaption ?? _ecaption,
  children: children ?? _children,
  functionName: functionName ?? _functionName,
);
  num? get id => _id;
  num? get fnId => _fnId;
  String? get enabled => _enabled;
  String? get visible => _visible;
  num? get ord => _ord;
  num? get parent => _parent;
  String? get caption => _caption;
  String? get ecaption => _ecaption;
  List<Children>? get children => _children;
  FunctionName? get functionName => _functionName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fn_id'] = _fnId;
    map['enabled'] = _enabled;
    map['visible'] = _visible;
    map['ord'] = _ord;
    map['parent'] = _parent;
    map['caption'] = _caption;
    map['ecaption'] = _ecaption;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    if (_functionName != null) {
      map['function_name'] = _functionName?.toJson();
    }
    return map;
  }

}



class FunctionName {
  FunctionName({
      num? fnId,
      String? fn,
      String? fnType,
      String? dsc,
      String? trial576,}){
    _fnId = fnId;
    _fn = fn;
    _fnType = fnType;
    _dsc = dsc;
    _trial576 = trial576;
}

  FunctionName.fromJson(dynamic json) {
    _fnId = json['fn_id'];
    _fn = json['fn'];
    _fnType = json['fn_type'];
    _dsc = json['dsc'];
    _trial576 = json['trial576'];
  }
  num? _fnId;
  String? _fn;
  String? _fnType;
  String? _dsc;
  String? _trial576;
FunctionName copyWith({  num? fnId,
  String? fn,
  String? fnType,
  String? dsc,
  String? trial576,
}) => FunctionName(  fnId: fnId ?? _fnId,
  fn: fn ?? _fn,
  fnType: fnType ?? _fnType,
  dsc: dsc ?? _dsc,
  trial576: trial576 ?? _trial576,
);
  num? get fnId => _fnId;
  String? get fn => _fn;
  String? get fnType => _fnType;
  String? get dsc => _dsc;
  String? get trial576 => _trial576;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fn_id'] = _fnId;
    map['fn'] = _fn;
    map['fn_type'] = _fnType;
    map['dsc'] = _dsc;
    map['trial576'] = _trial576;
    return map;
  }

}


class Children {
  Children({
      num? id,
      num? fnId,
      String? enabled,
      String? visible,
      num? ord,
      num? parent,
      String? caption,
      String? ecaption,
      List<Children>? children,
      FunctionName? functionName,}){
    _id = id;
    _fnId = fnId;
    _enabled = enabled;
    _visible = visible;
    _ord = ord;
    _parent = parent;
    _caption = caption;
    _ecaption = ecaption;
    _children = children;
    _functionName = functionName;
}

  Children.fromJson(dynamic json) {
    _id = json['id'];
    _fnId = json['fn_id'];
    _enabled = json['enabled'];
    _visible = json['visible'];
    _ord = json['ord'];
    _parent = json['parent'];
    _caption = json['caption'];
    _ecaption = json['ecaption'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(Children.fromJson(v));
      });
    }
    _functionName = json['function_name'] != null ? FunctionName.fromJson(json['function_name']) : null;
  }


  num? _id;
  num? _fnId;
  String? _enabled;
  String? _visible;
  num? _ord;
  num? _parent;
  String? _caption;
  String? _ecaption;
  List<Children>? _children;
  FunctionName? _functionName;
Children copyWith({  num? id,
  num? fnId,
  String? enabled,
  String? visible,
  num? ord,
  num? parent,
  String? caption,
  String? ecaption,
  List<Children>? children,
  FunctionName? functionName,
}) => Children(  id: id ?? _id,
  fnId: fnId ?? _fnId,
  enabled: enabled ?? _enabled,
  visible: visible ?? _visible,
  ord: ord ?? _ord,
  parent: parent ?? _parent,
  caption: caption ?? _caption,
  ecaption: ecaption ?? _ecaption,
  children: children ?? _children,
  functionName: functionName ?? _functionName,
);
  num? get id => _id;
  num? get fnId => _fnId;
  String? get enabled => _enabled;
  String? get visible => _visible;
  num? get ord => _ord;
  num? get parent => _parent;
  String? get caption => _caption;
  String? get ecaption => _ecaption;
  List<Children>? get children => _children;
  FunctionName? get functionName => _functionName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fn_id'] = _fnId;
    map['enabled'] = _enabled;
    map['visible'] = _visible;
    map['ord'] = _ord;
    map['parent'] = _parent;
    map['caption'] = _caption;
    map['ecaption'] = _ecaption;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    if (_functionName != null) {
      map['function_name'] = _functionName?.toJson();
    }
    return map;
  }

}


