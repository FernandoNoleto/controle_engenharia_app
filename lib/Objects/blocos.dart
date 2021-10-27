class Bloco {
  int id;
  String name;
  String value;

  Bloco({this.id = 0, this.name = "", this.value = ""});

  static List<Bloco> getBlocos() {
    return blocos;
  }

  static addBlocos(id, firstName, lastName) {
    var bloco = new Bloco();
    bloco.id = id;
    bloco.name = firstName;
    bloco.value = lastName;
    blocos.add(bloco);
  }

}

List<Bloco> blocos = [];