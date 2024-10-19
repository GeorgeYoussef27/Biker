class FormModel {
  FormModel({
    String? add,
    String? name,
    String? num,
  }) {
    _add = add;
    _name = name;
    _num = num;
  }

  FormModel.fromJson(dynamic json) {
    _add = json['add'];
    _name = json['name'];
    _num = json['num'];
  }

  String? _add;
  String? _name;
  String? _num;

  String? get add => _add;
  set add(String? value) => _add = value;

  String? get name => _name;
  set name(String? value) => _name = value;

  String? get num => _num;
  set num(String? value) => _num = value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['add'] = _add;
    map['name'] = _name;
    map['num'] = _num;
    return map;
  }
}