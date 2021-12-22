class Bloco {
  int id;
  String name;
  double value;

  Bloco(this.id, this.name, this.value);

  static List<Bloco> getBlocos() {
    return blocos;
  }

  static addBlocos(id, firstName, lastName) {
    var bloco = new Bloco(0, "", 0);
    bloco.id = id;
    bloco.name = firstName;
    bloco.value = lastName;
    blocos.add(bloco);
  }

  factory Bloco.fromJson(dynamic json) {
    return Bloco(
      json['id'] as int,
      json['name'] as String,
      json['value'] as double,
    );
  }

  Map toJson() => {
        'id': id,
        'name': name,
        'value': value,
      };

  @override
  String toString() {
    return '"Bloco" : {"id": $id, "name": $name, "value": $value}';
  }
}

List<Bloco> blocos = [];
