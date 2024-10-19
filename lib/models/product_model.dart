class ProductModel {
  ProductModel({
    String? img,
    String? id,
    String? name,
    String? parentId,
    String? color,
    num? price,
    String? type,
    String? model,
    num? kilometers,
    String? factory,
  }) {
    _id = id;
    _name = name;
    _parentId = parentId;
    _color = color;
    _price = price;
    _img = img;
    _type = type;
    _model = model;
    _kilometers =kilometers;
    _factory =factory;
  }

  ProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _parentId = json['parentId'];
    _color = json['color'];
    _img = json['img'];
    _price = json['price'];
    _type = json['type'];
    _model = json['model'];
    _kilometers =json["kilometers"];
    _factory= json['factory'];
  }

  String? _img;
  String? _id;
  String? _name;
  String? _parentId;
  String? _color;
  num? _price;
  String? _type;
  String ? _model;
  num? _kilometers;
  String?_factory;

  String? get id => _id;

  String? get name => _name;

  String? get parentId => _parentId;

  String? get color => _color;

  num? get price => _price;

  String? get img => _img;

  String? get type => _type;

  String? get model => _model;

  num? get kilometers => _kilometers;

  String? get factory => _factory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['parentId'] = _parentId;
    map['color'] = _color;
    map['img'] = _img;
    map['price'] = _price;
    map['type'] = _type;
    map['model']=_model;
    map['kilometers']=_kilometers;
    map['factory']=_factory;
    return map;
  }
}
